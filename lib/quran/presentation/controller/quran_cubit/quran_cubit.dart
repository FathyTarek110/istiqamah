import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';

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
  late String name = CacheHelper.returnText(key: 'name')!;
  late String lastReadAya = CacheHelper.returnText(key: 'lastReadName');
  late String lastReadAyaNumber= CacheHelper.returnText(key: 'lastRead');
  String apiLanguage = CacheHelper.returnText(key: 'apiLanguage');



  updateAyaNumber(){
    lastReadAyaNumber= CacheHelper.returnText(key: 'lastRead');
    emit(QuranUpdateBookMark());
  }

  static QuranCubit get(context)=>BlocProvider.of(context);


  late ScrollController scrollController ;
  scrollControllerInit(){
    scrollController = ScrollController();
    emit(QuranScrollControllerInitial());
  }
  getChapters()async{
    emit(QuranGetChaptersInitial());
    final result = await listChaptersUseCase.execute(apiLanguage);
    result.fold(
            (l) {
              emit(QuranGetChaptersError());
            }, (r) {
               chapters = r;
               allChapters = r.chapters;
               emit(QuranGetChaptersSuccess());
            });
  }

}
