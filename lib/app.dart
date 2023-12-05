
import 'package:flutter/material.dart';
import 'package:istiqamah/core/resources/routes_manager.dart';
import 'package:istiqamah/core/resources/theme_manager.dart';
import 'package:istiqamah/intro/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:istiqamah/main.dart';
import 'package:istiqamah/quran/presentation/screens/main_layout/main_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:show? const OnBoardingScreen() : const MainLayout(modeChange: false,),
      onGenerateRoute: RouteGenerator.getRoute,
      theme: myTheme(true,context),
      darkTheme: darkTheme(false, context),
      themeMode: isDark? ThemeMode.dark : ThemeMode.light,
    );
  }
}
