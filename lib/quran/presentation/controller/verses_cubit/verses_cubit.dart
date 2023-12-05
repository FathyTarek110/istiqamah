

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_aya_recitation.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah_translation.dart';
import 'package:audioplayers/audioplayers.dart';


import '../../../../core/resources/color_manager.dart';

part 'verses_state.dart';

class VersesCubit extends Cubit<VersesState> {
  VersesCubit(this.getSurah, this.getSurahTranslation, this.getAyaRecitation) : super(VersesInitial());
  static VersesCubit get(context)=>BlocProvider.of(context);
  late ScrollController scrollController;
  late String cachedAyaName = CacheHelper.returnText(key: 'lastReadName');
  late String cachedAyaNumber = CacheHelper.returnText(key: 'lastRead');
  final CaseGetSurah getSurah;
  final CaseGetAyaRecitation getAyaRecitation;
  List verses = [];
  final CaseGetSurahTranslation getSurahTranslation;
  late String apiLanguage = CacheHelper.returnText(key: 'apiLanguage');
  late int recitationId = CacheHelper.returnInt(key: 'recitationId');
  late int translationId = CacheHelper.returnInt(key: 'translationId');
  List verseTranslation = [];
  List bookmarkIcons = [
    Icon(Icons.bookmark_outline,color: ColorManager.primaryLight,),
    Icon(Icons.bookmark,color: ColorManager.primaryLight,)
  ];
  bool isAyaPlayed = false;
  List ayaAudio = [];
  final player = AudioPlayer();
  int selectedIndex= 0;


  void bookmarkAya(String ayaNumber){
    CacheHelper.insertText(key: 'lastRead', value: ayaNumber);
    emit(VersesBookMarkAya());
  }

  pushedPlayButton(int index){
    isAyaPlayed = true;
    selectedIndex = index;
    emit(VersesPushedPlayAyaButton());
  }

  Future<void> readAya(String ayaKey)async {
    isAyaPlayed = true;
    await playAyaRecitation(ayaKey);
      player.play(UrlSource('https://${ayaAudio[0]['url']}'));
      emit(VersesReadAya());
      player.onPlayerComplete.listen((event) {
        isAyaPlayed = false;
        player.stop();
        emit(VersesStopAya());
      });

  }

  void stopReadingAya(){
    isAyaPlayed = false;
    player.stop();
    emit(VersesStopAya());
  }


  saveAya(int ayaId){
    CacheHelper.insertInt(key: 'bookmark', value: ayaId);
  }


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
      (state);

    });
  }

  getSurahVersesTranslation(int surahId)async{
    emit(VersesGetSurahTranslationInitial());
    final result  = await getSurahTranslation.execute(surahId,translationId);
    result.fold((l) {
      emit(VersesGetSurahTranslationError());
    }, (r) {

      verseTranslation = r.surahTranslation;
      emit(VersesGetSurahTranslationSuccess());

    });
  }

  playAyaRecitation(String ayaKey)async{
     emit(VersesGetAyaRecitationInitial());
     final result = await getAyaRecitation.execute(recitationId, ayaKey);
     result.fold((l) {
       emit(VersesGetAyaRecitationError());
     }, (r) {
       ayaAudio =r.ayaAudio;
       emit(VersesGetAyaRecitationSuccess());
     });
  }

  bookMarkAya(String ayaNumber ,  BuildContext context,String ayaName){
    CacheHelper.insertText(key: 'lastRead', value: ayaNumber );
    cachedAyaNumber = CacheHelper.returnText(key: 'lastRead');
    CacheHelper.insertText(key: 'lastReadName', value: ayaName);
    cachedAyaName = CacheHelper.returnText(key: 'lastReadName');
        emit(VersesBookMarkAya());
}



}
