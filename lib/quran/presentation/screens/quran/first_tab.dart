import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';
import 'package:istiqamah/quran/presentation/screens/verses/verses.dart';


class QuranBySoura extends StatelessWidget {
  const QuranBySoura({super.key, required this.chapters, required this.refreshFunction});
  final List chapters;
  final Function refreshFunction;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme ;

    return Column(
      children: [
        ...chapters.map((chapter) {
          return QuranBySurahCard(textTheme: textTheme, surahNumber: chapter['id'], translatedName: chapter['name_simple'], arabicName: chapter['name_arabic'], revelationPlace: chapter['revelation_place'], versesCount: chapter['verses_count'], englishName: chapter['translated_name']['name'], refreshFunction: refreshFunction,);
        })
      ],
    );
  }
}

class QuranBySurahCard extends StatefulWidget {
  const QuranBySurahCard({
    super.key,
    required this.textTheme, required this.surahNumber, required this.translatedName, required this.arabicName, required this.revelationPlace, required this.versesCount, required this.englishName, required this.refreshFunction,
  });

  final TextTheme textTheme;
  final int surahNumber;
  final String translatedName;
  final String arabicName;
  final String revelationPlace;
  final int versesCount;
  final String englishName;
  final Function refreshFunction;

  @override
  State<QuranBySurahCard> createState() => _QuranBySurahCardState();
}

class _QuranBySurahCardState extends State<QuranBySurahCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> Verses(surahId: widget.surahNumber, translatedName: widget.translatedName, arabicName: widget.arabicName, revelationPlace: widget.revelationPlace, versesCount: widget.versesCount, englishName: widget.englishName,)));
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
                        Text(widget.surahNumber.toString(),style: widget.textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,fontSize: FontSize.s14),),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //enllishname
                      Text(widget.translatedName,style: widget.textTheme.bodyMedium,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //details
                          Text(widget.revelationPlace,style: widget.textTheme.bodyMedium?.copyWith(color: ColorManager.textGray),),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p4),
                            child: Icon(Icons.circle,size: AppSize.s4,color: ColorManager.textGray,),
                          ),
                          Text('${widget.versesCount.toString()} verses',style: widget.textTheme.bodyMedium?.copyWith(color: ColorManager.textGray),),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  //arabic name
                  Text(widget.arabicName,style: widget.textTheme.titleMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,fontSize: FontSize.s20),),


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
