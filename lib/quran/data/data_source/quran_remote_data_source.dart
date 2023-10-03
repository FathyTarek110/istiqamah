import 'package:dartz/dartz.dart';
import 'package:istiqamah/core/network_helper/dio_helper.dart';
import 'package:istiqamah/core/resources/strings_manager.dart';
import 'package:istiqamah/error/error_massage_model.dart';
import 'package:istiqamah/error/exception.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/data/model/chapters_mobel.dart';
import 'package:istiqamah/quran/domain/entity/chapter/chapter.dart';

import '../model/surah_model.dart';
import '../model/translated_surah_model.dart';

abstract class BaseRemoteQuranDataSource{
  Future<ChaptersModel> getListChapters();
  Future<SurahModel> getSurah(int surahId);
  Future<TranslatedSurah> getSurahTranslation(int surahId);
}

class RemoteQuranDataSource extends BaseRemoteQuranDataSource{
  @override
  Future<ChaptersModel> getListChapters() async{
    final response = await DioHelper.getData(url: '${UrlManager.quranBaseUrl}${UrlManager.listChaptersPoint}');
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
  Future<TranslatedSurah> getSurahTranslation(int surahId) async{
    final response = await DioHelper.getData(
        url: '${UrlManager.quranBaseUrl}${UrlManager.uthmaniSurahTranslationEndPoint}$surahId');
    if (response?.statusCode == 200) {
      return TranslatedSurah.fromJson(response?.data);
    }
    else {
      throw ServerException(ErrorMessageModel.fromJson(response?.data));
    }
  }
}