import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/data/data_source/quran_remote_data_source.dart';
import 'package:istiqamah/quran/domain/entity/quran/surah.dart';
import 'package:istiqamah/quran/domain/entity/recitation/aya_recitation.dart';
import 'package:istiqamah/quran/domain/entity/recitation/surah_recitaion.dart';
import 'package:istiqamah/quran/domain/entity/translation/surah_translation.dart';

import '../../../error/exception.dart';
import '../../domain/entity/chapters/chapters.dart';
import '../../domain/repository/base_Quran_repository.dart';

class ChaptersRepository extends BaseQuranRepository{
  final BaseRemoteQuranDataSource baseRemoteQuranDataSource;

  ChaptersRepository(this.baseRemoteQuranDataSource);
  @override
  Future<Either<Failure, Chapters>> listChapters(String apiLanguage) async{
    final result = await baseRemoteQuranDataSource.getListChapters(apiLanguage);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Surah>> getSurah(int surahId)async {
    final result = await baseRemoteQuranDataSource.getSurah(surahId);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, SurahTranslation>> getSurahTranslation(int surahId,int translationId) async{
    final result = await baseRemoteQuranDataSource.getSurahTranslation(surahId,translationId);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AyaRecitation>> getAyaRecitation(int recitationID, String ayaKey) async{
    final result = await baseRemoteQuranDataSource.getAyaRecitation(recitationID, ayaKey);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, SurahRecitation>> getSurahRecitation(int recitationID, int surahId) async {
    final result = await baseRemoteQuranDataSource.getSurahRecitation(recitationID, surahId);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }


}