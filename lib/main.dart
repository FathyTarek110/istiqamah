import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/core/network_helper/dio_helper.dart';
import 'package:istiqamah/core/services/service_locator.dart';
import 'app.dart';


bool show = true;
bool isDark = false ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  ServiceLocator.init();
  show = await CacheHelper.returnBool(key: 'onBoarding') ?? true;
  isDark = await CacheHelper.returnBool(key: 'isDark') ?? false ;
 runApp(Phoenix(child: const MyApp()));

}


