import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/hadith/presentation/screens/hadith.dart';
import 'package:istiqamah/prayer/presentation/screens/prayer_view.dart';
import 'package:meta/meta.dart';

import '../../screens/quran/quranview.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());
  static MainLayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List screens = [
    const QuranView(),
    const HadithView(),
    const PrayerView(),
  ];
  List<String> title = [
    'Quran',
    'Hadith',
    'Prayer Times'
  ];
  void changeIndex(int index){
    currentIndex = index;
    emit(MainLayoutChangeBottomNav());

  }
}
