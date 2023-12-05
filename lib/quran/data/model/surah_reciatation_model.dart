import 'package:istiqamah/quran/domain/entity/recitation/surah_recitaion.dart';

class SurahRecitationModel extends SurahRecitation{
  SurahRecitationModel({required super.surahAudio});

  factory SurahRecitationModel.fromJson(Map<String,dynamic> json){
    return SurahRecitationModel(surahAudio: json['audio_url']);
  }

}