import 'package:flutter/material.dart';
import 'package:istiqamah/core/resources/routes_manager.dart';
import 'package:istiqamah/core/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
          onGenerateRoute: RouteGenerator.getRoute,
      theme: myTheme(true,context),

    );
  }
}
