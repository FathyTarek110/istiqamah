import '../../domain/entity/recitation/aya_recitation.dart';

class AyaRecitationModel extends AyaRecitation {
  AyaRecitationModel({required super.ayaAudio});

 factory AyaRecitationModel.fromJson(Map<String,dynamic> json){
    return AyaRecitationModel(ayaAudio: json['audio_files']);
  }
}