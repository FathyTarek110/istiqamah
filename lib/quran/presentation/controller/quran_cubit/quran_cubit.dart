import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/quran/domain/entity/chapter/chapter.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/chapters/chapters.dart';
import '../../../domain/usecase/case_list_chapters.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.listChaptersUseCase) : super(QuranInitial());

  final ListChaptersUseCase listChaptersUseCase;
  late Chapters chapters;
   List allChapters = [];
   late String bookMarkSoura;
  late String bookMarkVerseKey;
  late String name;


  getName(){
    name = CacheHelper.returnText(key: 'name')!;
    print(name);
  }
  getBookMark(){
    bookMarkSoura =  CacheHelper.returnText(key: 'bookmarkSoura')!;
     CacheHelper.returnText(key: 'bookmarkVerseKey')!;
     emit(QuranGetBookMarkSuccess());
}



  static QuranCubit get(context)=>BlocProvider.of(context);
  late ScrollController scrollController ;
  scrollControllerInit(){
    scrollController = ScrollController();
    emit(QuranScrollControllerInitial());
  }
  getChapters()async{
    emit(QuranGetChaptersInitial());
    final result = await listChaptersUseCase.execute();
    result.fold(
            (l) {
              emit(QuranGetChaptersError());
              print(state);
            }, (r) {
               chapters = r;
               allChapters = r.chapters;
               emit(QuranGetChaptersSuccess());
               print(state);
            });
  }

}
