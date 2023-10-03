import 'package:flutter/material.dart';
import 'package:istiqamah/intro/presentation/screens/onboarding_screen/register_screen.dart';
import 'package:istiqamah/quran/presentation/screens/main_layout.dart';

import '../../intro/presentation/screens/onboarding_screen/onboarding_screen.dart';
import '../../intro/presentation/screens/splash_screen/splash_screen.dart';

class Routes{
static const String splashRoute = '/';
static const String onBoaringRoute = '/onboarding_screen';
static const String mainLayoutRoute = '/main_layout.dart';
static const String registerRoute = '/register_screen.dart';


}

class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>  const SplashScreen());

      case Routes.onBoaringRoute:
        return MaterialPageRoute(builder: (_)=>  const OnBoardingScreen());
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_)=>  const MainLayout());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=>  const RegisterPage());
    }
    return MaterialPageRoute(builder: (_)=> const Scaffold(
      body: Center(child: Text('error occurred  please restart the app'),),
    ));
  }

}