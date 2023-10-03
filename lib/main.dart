import 'package:flutter/material.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/core/network_helper/dio_helper.dart';
import 'package:istiqamah/core/services/service_locator.dart';
import 'app.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  ServiceLocator.init();
  runApp( MyApp(isFirst: false,));
}


