import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/translation/surah_translation.dart';
import 'package:istiqamah/quran/domain/repository/base_Quran_repository.dart';

class CaseGetSurahTranslation{
  final BaseQuranRepository baseQuranRepository;

  CaseGetSurahTranslation(this.baseQuranRepository);

  Future<Either<Failure,SurahTranslation>> execute (int surahId)async{
    return await baseQuranRepository.getSurahTranslation(surahId);
  }
}