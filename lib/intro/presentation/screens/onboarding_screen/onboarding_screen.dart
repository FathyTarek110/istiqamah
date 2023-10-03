import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/routes_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ISTIQAMAH',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.primary),),
          Text('Your Muslim Friend',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: FontSize.s18),),
          const SizedBox(height: AppSize.s10,),
          Text('وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18),),
          const SizedBox(height: AppSize.s10,),

          Center(
            child: SvgPicture.asset(
                'assets/images/Group 1.svg',
              height: MediaQuery.of(context).size.height/1.8,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.scaleDown,
            ),
          ),

          SizedBox(
              width: MediaQuery.of(context).size.width/2,
              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.registerRoute);
              }, child: const Text('Next')))
        ],
      ),
    );
  }
}
