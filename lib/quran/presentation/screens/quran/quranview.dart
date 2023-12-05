import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';
import 'package:istiqamah/quran/presentation/controller/quran_cubit/quran_cubit.dart';
import 'package:istiqamah/quran/presentation/screens/quran/first_tab.dart';

import '../../../../core/services/service_locator.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(sl())..scrollControllerInit()..updateAyaNumber()..getChapters(),
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final QuranCubit cubit = QuranCubit.get(context);
          TextTheme textTheme = Theme.of(context).textTheme ;
          Size size = MediaQuery.of(context).size;
          return  ConditionalBuilder(condition: state is QuranGetChaptersSuccess, builder: (_)=>CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: cubit.scrollController,
            slivers: [
              //name
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all( AppPadding.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Asslamualaikum',style: textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18,color: ColorManager.textGray),),
                      Text(cubit.name,style: textTheme.bodyLarge?.copyWith(fontSize: FontSize.s24,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),),
                    ],
                  ),
                ),
              ),
              //card
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            gradient: LinearGradient(colors: [
                              ColorManager.gradient1,
                              ColorManager.gradient2
                            ],
                            )
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.menu_book_outlined,color: ColorManager.white,),
                                  const SizedBox(width: AppSize.s8,),
                                  Text('Last Read',style: textTheme.bodyMedium?.copyWith(fontSize: FontSize.s14,color: Colors.white),)
                                ],
                              ),
                              const SizedBox(height: AppSize.s20,),
                              Text(cubit.lastReadAya,style: textTheme.bodyLarge?.copyWith(fontSize: FontSize.s20,color: ColorManager.white),),
                              const SizedBox(height: AppSize.s4,),
                              Text('Ayah No: ${cubit.lastReadAyaNumber}',style: textTheme.bodySmall?.copyWith(fontSize: FontSize.s14,color: ColorManager.white),)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: -20,
                        child: SizedBox(
                            width: size.width*0.5,
                            child: Image.asset('assets/images/Quran.png')),
                      )
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p24,horizontal: AppPadding.p16),
                    child: Column(
                      children: [
                        ConditionalBuilder(
                            condition: state is QuranGetChaptersSuccess,
                            builder: (_)=>QuranBySoura(chapters: cubit.allChapters, refreshFunction: cubit.updateAyaNumber,), fallback: (_)=>Center(child: CircularProgressIndicator(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryDark,)))
                      ],
                    ),
                  )
              )
            ],
          ), fallback: (_)=>Center(child: CircularProgressIndicator(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.primaryDark,)));
        },
      ),
    );
  }
}
