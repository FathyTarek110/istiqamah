import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/quran/surah.dart';

import '../repository/base_Quran_repository.dart';
class CaseGetSurah{
  final BaseQuranRepository baseQuranRepository;

  CaseGetSurah(this.baseQuranRepository);

  Future<Either<Failure, Surah>> execute(int surahId)async{
    return await baseQuranRepository.getSurah(surahId);
  }
}