import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';
import 'package:istiqamah/quran/presentation/screens/verses/verses.dart';

import '../../../domain/entity/chapter/chapter.dart';
import '../../../domain/entity/chapters/chapters.dart';

class QuranBySoura extends StatelessWidget {
  const QuranBySoura({super.key, required this.chapters});
  final List chapters;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme ;

    return Column(
      children: [
        ...chapters.map((chapter) {
          return QuranBySurahCard(textTheme: textTheme, surahNumber: chapter['id'], translatedName: chapter['name_simple'], arabicName: chapter['name_arabic'], revelationPlace: chapter['revelation_place'], versesCount: chapter['verses_count'], englishName: chapter['translated_name']['name'],);
        })
      ],
    );
  }
}

class QuranBySurahCard extends StatelessWidget {
  const QuranBySurahCard({
    super.key,
    required this.textTheme, required this.surahNumber, required this.translatedName, required this.arabicName, required this.revelationPlace, required this.versesCount, required this.englishName,
  });

  final TextTheme textTheme;
  final int surahNumber;
  final String translatedName;
  final String arabicName;
  final String revelationPlace;
  final int versesCount;
  final String englishName;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> Verses(surahId: surahNumber, translatedName: translatedName, arabicName: arabicName, revelationPlace: revelationPlace, versesCount: versesCount, englishName: englishName,)));
      },
      child: Card(

      elevation: AppSize.s4,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p16),
                    child: Stack(

                      alignment: Alignment.center,

                      children: [
                        SvgPicture.asset('assets/icons/surahnumbercontainer.svg'),
                        //surah number
                        Text(surahNumber.toString(),style: textTheme.bodyMedium?.copyWith(color: ColorManager.textMediumLight,fontSize: FontSize.s14),),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //enllishname
                      Text(translatedName,style: textTheme.bodyMedium,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //details
                          Text(revelationPlace,style: textTheme.bodyMedium?.copyWith(color: ColorManager.textGray),),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p4),
                            child: Icon(Icons.circle,size: AppSize.s4,color: ColorManager.textGray,),
                          ),
                          Text('${versesCount.toString()} verses',style: textTheme.bodyMedium?.copyWith(color: ColorManager.textGray),),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  //arabic name
                  Text(arabicName,style: textTheme.titleMedium?.copyWith(color: ColorManager.primary,fontSize: FontSize.s20),),


                ],

              ),
              const SizedBox(height: AppSize.s8,)
            ],
          ),
        ),
      ),
    );
  }
}
