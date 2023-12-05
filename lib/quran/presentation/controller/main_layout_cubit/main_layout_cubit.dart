import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/prayer/presentation/screens/prayer_view.dart';
import 'package:meta/meta.dart';
import 'package:restart_app/restart_app.dart';

import '../../screens/quran/quranview.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());
  static MainLayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List screens = [
    const QuranView(),
    const PrayerView(),
  ];
  List<String> title = [
    'Quran',
    'Prayer Times'
  ];
  void changeIndex(int index){
    currentIndex = index;
    emit(MainLayoutChangeBottomNav());

  }

  isModeChanged(bool isModeChanged){
    if(isModeChanged){
      Restart.restartApp(webOrigin: '/main_layout.dart');
    }
  }
}
