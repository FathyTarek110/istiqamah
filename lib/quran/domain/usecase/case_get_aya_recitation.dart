import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/recitation/aya_recitation.dart';
import 'package:istiqamah/quran/domain/repository/base_Quran_repository.dart';

class CaseGetAyaRecitation{
  final BaseQuranRepository baseQuranRepository;

  CaseGetAyaRecitation(this.baseQuranRepository);

  Future<Either<Failure,AyaRecitation>> execute(int recitationID, String ayaKey){
    return baseQuranRepository.getAyaRecitation(recitationID, ayaKey);
  }
}