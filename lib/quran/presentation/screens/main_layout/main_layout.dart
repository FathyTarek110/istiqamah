import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/quran/presentation/controller/main_layout_cubit/main_layout_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'drawer/about us.dart';
import 'drawer/settings.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.modeChange});
 final bool modeChange;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainLayoutCubit()..isModeChanged(modeChange),
      child: BlocConsumer<MainLayoutCubit, MainLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MainLayoutCubit cubit = MainLayoutCubit.get(context);
          return Scaffold(
            drawer: const NavigationDrawer(

            ),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),
              title: Text(cubit.title[cubit.currentIndex], style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: FontSize.s20),),
              actions: const [
              ],
            ),
            body: cubit.screens[cubit.currentIndex],

          );
        },
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width/2,
      child: Padding(
        padding:  const EdgeInsets.symmetric(vertical: AppPadding.p24,horizontal: AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const Settings()));
            }
              ,style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) =>Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,)), child: Text('Settings',style: Theme.of(context).textTheme.bodyMedium,),),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AboutUs()));
            },style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,)), child: Text('About US',style: Theme.of(context).textTheme.bodyMedium,)),
          ],
        ),
      ),
    );
  }
}

