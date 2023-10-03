import 'package:istiqamah/quran/domain/entity/quran/surah.dart';

class SurahModel extends Surah {
  SurahModel(super.verses);

  factory SurahModel.fromJson(Map<String,dynamic> json){
    return SurahModel(json['verses']);
  }
}