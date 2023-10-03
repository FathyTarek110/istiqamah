import 'package:istiqamah/quran/domain/entity/translation/surah_translation.dart';

class TranslatedSurah extends SurahTranslation{
  TranslatedSurah(super.surahTranslation);
  
  factory TranslatedSurah.fromJson(Map<String,dynamic> json){
    return TranslatedSurah(json['translations']);
  }
}