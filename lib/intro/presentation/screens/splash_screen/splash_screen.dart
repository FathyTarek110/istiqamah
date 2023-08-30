import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageOnStart();
    goNext();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedOpacity(
            opacity: imageOpacity,
            duration: const Duration(seconds: AppTime.s3),
            curve: Curves.linear,
            child: SvgPicture.asset('assets/images/istiqamah.svg')),
      ),
    );
  }
  Timer goNext(){
    return Timer(const Duration(seconds: AppTime.s4), () {
      setState(() {
        Navigator.pushReplacementNamed(context, Routes.onBoaringRoute);
      });
    });
  }
  Timer imageOnStart(){
    return Timer(  const Duration(seconds: AppTime.s1), () {
      setState(() {
        imageOpacity = 1;
      });
    });
  }
}
