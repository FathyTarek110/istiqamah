import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/recitation/surah_recitaion.dart';
import 'package:istiqamah/quran/domain/repository/base_Quran_repository.dart';

class CaseGetSurahRecitation{
  final BaseQuranRepository baseQuranRepository;

  CaseGetSurahRecitation({required this.baseQuranRepository});

  Future<Either<Failure,SurahRecitation>> execute(int recitationID,int surahId){
    return baseQuranRepository.getSurahRecitation(recitationID, surahId);
  }
}