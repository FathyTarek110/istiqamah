import 'package:get_it/get_it.dart';
import 'package:istiqamah/quran/data/data_source/quran_remote_data_source.dart';
import 'package:istiqamah/quran/data/repository/quran_repository.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_aya_recitation.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah_recitation.dart';
import 'package:istiqamah/quran/domain/usecase/case_get_surah_translation.dart';
import 'package:istiqamah/quran/domain/usecase/case_list_chapters.dart';

import '../../quran/domain/repository/base_Quran_repository.dart';

final sl = GetIt.instance;

class ServiceLocator{
  static void init(){
    //use cases
      sl.registerLazySingleton<ListChaptersUseCase>(() => ListChaptersUseCase(sl()));
      sl.registerLazySingleton<CaseGetSurah>(() => CaseGetSurah(sl()));
      sl.registerLazySingleton<CaseGetSurahTranslation>(() => CaseGetSurahTranslation(sl()));
      sl.registerLazySingleton<CaseGetAyaRecitation>(() => CaseGetAyaRecitation(sl()));
      sl.registerLazySingleton<CaseGetSurahRecitation>(() => CaseGetSurahRecitation(baseQuranRepository: sl()));

      //repositories
    sl.registerLazySingleton<BaseQuranRepository>(() => ChaptersRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseRemoteQuranDataSource>(() => RemoteQuranDataSource());
  }
}