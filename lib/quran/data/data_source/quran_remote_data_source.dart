import 'package:istiqamah/core/network_helper/dio_helper.dart';
import 'package:istiqamah/core/resources/strings_manager.dart';
import 'package:istiqamah/error/error_massage_model.dart';
import 'package:istiqamah/error/exception.dart';
import 'package:istiqamah/quran/data/model/aya_recitation_model.dart';
import 'package:istiqamah/quran/data/model/chapters_mobel.dart';

import '../model/surah_model.dart';
import '../model/surah_reciatation_model.dart';
import '../model/translated_surah_model.dart';

abstract class BaseRemoteQuranDataSource{
  Future<ChaptersModel> getListChapters(String apiLanguage);
  Future<SurahModel> getSurah(int surahId);
  Future<TranslatedSurah> getSurahTranslation(int surahId,int translationId);
  Future<SurahRecitationModel> getSurahRecitation(int recitationID,int surahId);
  Future<AyaRecitationModel> getAyaRecitation(int recitationID, String ayaKey);
}

class RemoteQuranDataSource extends BaseRemoteQuranDataSource{
  @override
  Future<ChaptersModel> getListChapters(String apiLanguage) async{
    final response = await DioHelper.getData(url: '${UrlManager.quranBaseUrl}${UrlManager.listChaptersPoint}?language=$apiLanguage');
    if(response?.statusCode == 200){
      return ChaptersModel.fromJson(response?.data);
    }
    else{
      throw ServerException(ErrorMessageModel.fromJson(response?.data));
    }

  }

  @override
  Future<SurahModel> getSurah(int surahId) async {
    final response = await DioHelper.getData(
        url: '${UrlManager.quranBaseUrl}${UrlManager
            .uthmaniSurahEndPoint}$surahId');
    if (response?.statusCode == 200) {
      return SurahModel.fromJson(response?.data);
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response?.data));
    }
  }

  @override
  Future<TranslatedSurah> getSurahTranslation(int surahId,int translationId) async{
    final response = await DioHelper.getData(
        url: '${UrlManager.quranBaseUrl}${UrlManager.uthmaniSurahTranslationEndPoint}$translationId?chapter_number=$surahId');
    if (response?.statusCode == 200) {
      return TranslatedSurah.fromJson(response?.data);
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response?.data));
    }
  }

  @override
  Future<AyaRecitationModel> getAyaRecitation(int recitationID, String ayaKey) async{
    final response = await DioHelper.getData(
        url: '${UrlManager.quranBaseUrl}${UrlManager.recitations}$recitationID/by_ayah/$ayaKey');
    if(response?.statusCode == 200){
      return AyaRecitationModel.fromJson(response?.data);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response?.data));

    }
  }

  @override
  Future<SurahRecitationModel> getSurahRecitation(int recitationID, int surahId) async {
    final response = await DioHelper.getData(
        url: '${UrlManager.quranBaseUrl}${UrlManager.surahRecitation}$recitationID/$surahId');
    if(response?.statusCode == 200){
      return SurahRecitationModel.fromJson(response?.data);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response?.data));

    }
  }
}