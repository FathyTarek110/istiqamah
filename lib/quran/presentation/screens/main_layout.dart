import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/quran/presentation/controller/main_layout_cubit/main_layout_cubit.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainLayoutCubit(),
      child: BlocConsumer<MainLayoutCubit, MainLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MainLayoutCubit cubit = MainLayoutCubit.get(context);
          return Scaffold(
            drawer: const NavigationDrawer(),
            appBar: AppBar(
              title: Text(cubit.title[cubit.currentIndex], style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: FontSize.s20),),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Image.asset('assets/icons/bottom_nav/quranUnslected.png'),activeIcon: Image.asset('assets/icons/bottom_nav/quranselected.png'),label: 'quran',),
                BottomNavigationBarItem(icon:  Image.asset('assets/icons/bottom_nav/hadithUnslected.png'),activeIcon: Image.asset('assets/icons/bottom_nav/hadithselected.png'),label: 'hadith'),
                BottomNavigationBarItem(icon:  Image.asset('assets/icons/bottom_nav/prayerunslected.png'),activeIcon: Image.asset('assets/icons/bottom_nav/prayerselected.png'),label: 'prayer'),

              ],
            ),
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
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ],
        ),
      ),
    );
  }
}

