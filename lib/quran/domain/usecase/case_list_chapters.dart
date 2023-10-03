import 'package:dartz/dartz.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/chapter/chapter.dart';

import '../entity/chapters/chapters.dart';
import '../repository/base_Quran_repository.dart';

class ListChaptersUseCase{
  final BaseQuranRepository baseChapterRepository;

  ListChaptersUseCase(this.baseChapterRepository);
  Future<Either<Failure,Chapters>> execute(){
    return baseChapterRepository.listChapters();
  }
}