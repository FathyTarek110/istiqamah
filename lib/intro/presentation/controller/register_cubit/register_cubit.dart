import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController nameTextEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void setName(){
    print(nameTextEditingController.value.text);
    CacheHelper.insertText(key: 'name', value: nameTextEditingController.value.text);
   String? name = CacheHelper.returnText(key: 'name');
   print(name);
  }
  void isFirst(){
    CacheHelper.insertBool(key: 'isFirst', value: false);
  }
  static RegisterCubit get(context)=>BlocProvider.of(context);

}
