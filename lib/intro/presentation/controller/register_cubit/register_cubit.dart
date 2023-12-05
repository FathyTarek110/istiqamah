import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController nameTextEditingController = TextEditingController();
  int recitationId = 12;
  int translationId = 22;
  String languageApi = 'en';
  bool isDarkTheme =false;

  var formKey = GlobalKey<FormState>();
  void chooseRecitation(int? value){
    recitationId =  value!;
    emit(RegisterChooseRecitation());
  }

  void changeMode( bool value){
    isDarkTheme = value;
    emit(RegisterChangeMode());
  }
  void chooseTranslation(int? value, String slanguageApi){
    translationId =  value!;
    languageApi = slanguageApi;
    emit(RegisterChooseRecitation());
  }
  void setName(){
    CacheHelper.insertText(key: 'name', value: nameTextEditingController.value.text);
  }
  void setRecitationId(){
    CacheHelper.insertInt(key: 'recitationId', value: recitationId);
}
  void setTranslationId(){
    CacheHelper.insertInt(key: 'translationId', value: translationId);
  }
  void setApiLanguage(){
    CacheHelper.insertText(key: 'apiLanguage', value: languageApi);
  }
  void isFirst(){
    CacheHelper.insertBool(key: 'onBoarding', value: false);
  }
  void isDark(bool isDark){

    CacheHelper.insertBool(key: 'isDark', value: isDark);
  }
  void lastRead(){
    CacheHelper.insertText(key: 'lastReadName', value: 'Al-Fatihah');
    CacheHelper.insertText(key: 'lastRead', value: '1:1');
  }
  static RegisterCubit get(context)=>BlocProvider.of(context);

}
