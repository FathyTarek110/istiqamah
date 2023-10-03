import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/error/failure.dart';
import 'package:istiqamah/quran/domain/entity/quran/surah.dart';
import 'package:istiqamah/quran/domain/entity/translation/surah_translation.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah_translation.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/color_manager.dart';

part 'verses_state.dart';

class VersesCubit extends Cubit<VersesState> {
  VersesCubit(this.getSurah, this.getSurahTranslation) : super(VersesInitial());
  final CaseGetSurah getSurah;
  List verses = [];
  final CaseGetSurahTranslation getSurahTranslation;
  List verseTranslation = [];
  List bookmarkIcons = [
  Icon(Icons.share_outlined,color: ColorManager.primary,),
    Icon(Icons.bookmark_outline,color: ColorManager.primary,),
    Icon(Icons.bookmark,color: ColorManager.primary,)
  ];
  bool bookmarkActive = false;


  saveAya(int ayaId){
    CacheHelper.insertInt(key: 'bookmark', value: ayaId);
  }

  static VersesCubit get(context)=>BlocProvider.of(context);
  late ScrollController scrollController;
  scrollControllerInit(){
    scrollController = ScrollController();
    emit(VersesScrollControllerInitial());
  }


  getSurahVerses(int surahId)async{
    emit(VersesGetSurahInitial());
    final result  = await getSurah.execute(surahId);
    result.fold((l) {
      emit(VersesGetSurahError());
    }, (r) {
      verses = r.verses;
      emit(VersesGetSurahSuccess());
      print(state);

    });
  }

  getSurahVersesTranslation(int surahId)async{
    emit(VersesGetSurahTranslationInitial());
    final result  = await getSurahTranslation.execute(surahId);
    result.fold((l) {
      emit(VersesGetSurahTranslationError());
      print(state);
    }, (r) {

      verseTranslation = r.surahTranslation;
      emit(VersesGetSurahTranslationSuccess());
      print(state);

    });
  }


}
