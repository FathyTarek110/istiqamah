import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/chapters/chapters.dart';
import 'package:istiqamah/quran/domain/entity/recitation/aya_recitation.dart';
import 'package:istiqamah/quran/domain/entity/recitation/surah_recitaion.dart';

import '../entity/quran/surah.dart';
import '../entity/translation/surah_translation.dart';

abstract class BaseQuranRepository{
  Future<Either<Failure,Chapters>> listChapters(String apiLanguage);
  Future<Either<Failure,Surah>> getSurah(int surahId);
  Future<Either<Failure,SurahTranslation>> getSurahTranslation(int surahId,int translationId);
  Future<Either<Failure,SurahRecitation>> getSurahRecitation(int recitationID, int surahId);
  Future<Either<Failure,AyaRecitation>> getAyaRecitation(int recitationID, String ayaKey);
}