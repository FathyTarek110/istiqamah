import 'package:flutter/material.dart';
import 'package:istiqamah/quran/presentation/screens/splash_screen/splash_screen.dart';

class Routes{
static const String splashRoute = '/';
}

class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>  SplashScreen());
    }
    return MaterialPageRoute(builder: (_)=> const Scaffold(
      body: Center(child: Text('error occurred  please restart the app'),),
    ));
  }

}