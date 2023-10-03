import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:istiqamah/core/cache_helper/cache_helper.dart';
import 'package:istiqamah/core/resources/routes_manager.dart';
import 'package:istiqamah/core/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirst});
  final bool? isFirst;

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.mainLayoutRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: myTheme(true,context),
    );
  }
}
