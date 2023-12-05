import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/quran/presentation/controller/verses_cubit/verses_cubit.dart';
import 'package:istiqamah/quran/presentation/screens/main_layout/main_layout.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/services/service_locator.dart';

class Verses extends StatelessWidget {
  const Verses({super.key, required this.surahId, required this.translatedName, required this.arabicName, required this.revelationPlace, required this.versesCount, required this.englishName});
  final int  surahId;
  final String translatedName;
  final String arabicName;
  final String revelationPlace;
  final int versesCount;
  final String englishName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VersesCubit(sl(),sl(),sl())..scrollControllerInit()..getSurahVerses(surahId)..getSurahVersesTranslation(surahId),
      child: BlocConsumer<VersesCubit, VersesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          VersesCubit cubit = VersesCubit.get(context);
          TextTheme textTheme = Theme.of(context).textTheme ;
          Size size = MediaQuery.of(context).size;

          return Scaffold(
            body:CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: cubit.scrollController,
              slivers: [
                SliverAppBar(
                  leading: IconButton(onPressed: (){
                    cubit.player.stop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const MainLayout(modeChange: false,)));
                  }, icon: Icon(Icons.arrow_back,color: ColorManager.textGray,),
                    splashColor: Colors.transparent,
                  ),
                  title: Text(translatedName,style: textTheme.bodyLarge?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,fontSize: FontSize.s20),),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p24),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              gradient: LinearGradient(colors: [
                                ColorManager.gradient1,
                                ColorManager.gradient2
                              ],

                              )),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: AppSize.s28,
                                ),
                                Text(translatedName,style: textTheme.bodyMedium?.copyWith(color: ColorManager.white,fontSize: FontSize.s26),),
                                Text(englishName,style: textTheme.bodyMedium?.copyWith(color: ColorManager.white,fontSize: FontSize.s16),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                                  child: Container(
                                    width: size.width/3,
                                    height: AppSize.s1,
                                    color: ColorManager.white,
                                  ),

                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(revelationPlace,style: textTheme.bodyMedium?.copyWith(color: ColorManager.white),),
                                    Padding(
                                      padding: const EdgeInsets.all(AppPadding.p4),
                                      child: Icon(Icons.circle,size: AppSize.s4,color: ColorManager.textGray,),
                                    ),
                                    Text('$versesCount verses',style: textTheme.bodyMedium?.copyWith(color: ColorManager.white),),

                                  ],),
                                const SizedBox(
                                  height: AppSize.s32,
                                ),
                                Image.asset('assets/icons/basmalah.png'),
                                const SizedBox(
                                  height: AppSize.s28,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: -30,
                          bottom: -20,
                          child: Opacity(
                              opacity: 0.1,
                              child: Image.asset('assets/images/Quran.png')),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ConditionalBuilder(
                      condition: cubit.verses.isNotEmpty && cubit.verseTranslation.isNotEmpty,
                      builder: (_)=>Column(
                        children: [
                          ...cubit.verses.map((e) {
                           var index = cubit.verses.indexOf(e);
                            return AyaCard(textTheme: textTheme, ayaNumber: e['verse_key'], ayaText: e['text_uthmani'], ayaTranslation: cubit.verseTranslation[index]['text'], playIcon: cubit.isAyaPlayed && cubit.selectedIndex == index?  Icon(Icons.stop_outlined,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryDark,) : Icon(Icons.play_arrow_outlined,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryLight,) ,playFunction:cubit.isAyaPlayed ?(){cubit.stopReadingAya();} : (){
                              cubit.pushedPlayButton(index);
                              cubit.readAya(e['verse_key']);
                              }, savedIcon: cubit.cachedAyaNumber == e['verse_key'] ? cubit.bookmarkIcons[1] :cubit.bookmarkIcons[0],bookmarkFunction:(){
                                cubit.bookMarkAya(e['verse_key'],context,translatedName);

                            }
                            );
                          }).toList()
                        ],
                      ),
                      fallback: (_)=>Center(child: CircularProgressIndicator(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryDark,),)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class AyaCard extends StatelessWidget {
  const AyaCard({
    super.key,
    required this.textTheme, required this.ayaNumber, required this.ayaText, required this.ayaTranslation, required this.playIcon, this.playFunction, required this.savedIcon, this.bookmarkFunction,
  });
  final TextTheme textTheme;
  final String ayaNumber;
  final String ayaText;
  final String ayaTranslation;
  final Icon playIcon;
  final void Function()? playFunction;
  final Icon savedIcon;
  final void Function()? bookmarkFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p24),
      child: Card(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                color: Theme.of(context).brightness == Brightness.light ? ColorManager.whiteSmoke : ColorManager.greyDark
              ),
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.s10,horizontal: AppSize.s13),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryDark ,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(ayaNumber,style: textTheme.bodyMedium?.copyWith(fontSize: FontSize.s14,color: Colors.white),),
                      ),
                    ),
                  ),
                  const Spacer(),
                  //IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined,color: ColorManager.primary,)),
                  IconButton(onPressed: playFunction, icon: playIcon,),
                  IconButton(onPressed: bookmarkFunction, icon: savedIcon),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(ayaText,style: textTheme.titleMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,fontSize: FontSize.s18),textAlign: TextAlign.end,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: Text(Bidi.stripHtmlIfNeeded(ayaTranslation).replaceFirst(RegExp('1'), ""),style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,fontSize: FontSize.s16,),)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
