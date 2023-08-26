import 'package:flutter/material.dart';
import 'package:istiqamah/core/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
          onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
