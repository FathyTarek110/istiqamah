import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/chapters/chapters.dart';

import '../entity/quran/surah.dart';
import '../entity/translation/surah_translation.dart';

abstract class BaseQuranRepository{
  Future<Either<Failure,Chapters>> listChapters();
  Future<Either<Failure,Surah>> getSurah(int surahId);
  Future<Either<Failure,SurahTranslation>> getSurahTranslation(int surahId);
}