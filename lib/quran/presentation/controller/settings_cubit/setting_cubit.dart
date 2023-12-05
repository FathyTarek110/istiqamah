import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  static SettingCubit get(context)=>BlocProvider.of(context);
  TextEditingController nameTextEditingController = TextEditingController();
  int recitationId = CacheHelper.returnInt(key: 'recitationId');
  int translationId = CacheHelper.returnInt(key: 'translationId');
  String languageApi = CacheHelper.returnText(key: 'apiLanguage');
  String name = CacheHelper.returnText(key: 'name');
  bool isDarkTheme = CacheHelper.returnBool(key: 'isDark');
  var formKey = GlobalKey<FormState>();

  void changeMode( bool value){
    isDarkTheme = value;
    CacheHelper.insertBool(key: 'isDark', value: isDarkTheme);
    emit(SettingChangeMode());
  }
  void chooseRecitation(int? value){
    recitationId =  value!;
    emit(SettingChooseRecitation());
  }
  void chooseTranslation(int? value, String slanguageApi){
    translationId =  value!;
    languageApi = slanguageApi;
    emit(SettingChooseRecitation());
  }
  void setName(){
    CacheHelper.insertText(key: 'name', value: nameTextEditingController.value.text);
  }
  void setRecitationId(){
    CacheHelper.insertInt(key: 'recitationId', value: recitationId);
  }
  void isDark(){

    CacheHelper.insertBool(key: 'isDark', value: isDarkTheme);
  }
  void setTranslationId(){
    CacheHelper.insertInt(key: 'translationId', value: translationId);
  }
  void setApiLanguage(){
    CacheHelper.insertText(key: 'apiLanguage', value: languageApi);
  }

}
