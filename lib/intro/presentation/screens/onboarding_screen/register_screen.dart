import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/reusable_components.dart';
import 'package:istiqamah/quran/presentation/screens/main_layout/main_layout.dart';

import '../../../../core/resources/values_manager.dart';
import '../../controller/register_cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Center(
          child: Padding(
            padding:  const EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('activate dark mode',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,)),
                      const Spacer(),
                      Switch(
                        activeColor: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,
                          value: cubit.isDarkTheme, onChanged: (value){
                          cubit.changeMode(value);
                      })
                    ],
                  ),
                  const SizedBox(height: AppSize.s10,),
                  myTextFormField(context: context, hintText: 'please enter your name',controller: cubit.nameTextEditingController, label: 'Name', obscure: false, enableSuggestions: false, autoCorrect: false,validate: (value){
                    if(value.isEmpty){
                      return 'name can\'t be empty' ;
                    }
                  }, color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),
                  const SizedBox(height: AppSize.s10,),
                  Text('choose your favourite reciter :',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),),
                  const SizedBox(height: AppSize.s10,),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton<int>(
                      isExpanded: true,
                      value: cubit.recitationId,
                      items: const [
                        DropdownMenuItem(
                            value: 12,
                            child: Text('Mahmoud Khalil Al-Husary / محمود خليل ')),
                        DropdownMenuItem(
                            value: 11,
                            child: Text('Mohamed al-Tablawi / محمد الطبلاوي')),
                      ],
                      onChanged: (int? value) {
                        cubit.chooseRecitation(value);
                      },
                      icon: Icon(Icons.record_voice_over_outlined,color:Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),
                    )
                  ),
                  const SizedBox(height: AppSize.s10,),
                  Text('choose language of quran translation  :',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),),
                  const SizedBox(height: AppSize.s10,),

                  SizedBox(
                      width: double.infinity,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: cubit.translationId,
                        items: const [
                          DropdownMenuItem(
                              value: 22,
                              child: Text('English')),

                          DropdownMenuItem(
                              value: 78,
                              child: Text('Russian')),

                          DropdownMenuItem(
                              value: 136,
                              child: Text('French')),
                          DropdownMenuItem(
                              value: 208,
                              child: Text('German')),
                          DropdownMenuItem(
                              value: 153,
                              child: Text('Italian')),
                          DropdownMenuItem(
                              value: 83,
                              child: Text('Spanish')),
                          DropdownMenuItem(
                              value: 218,
                              child: Text('Japanese')),
                          DropdownMenuItem(
                              value: 234,
                              child: Text('Urdu')),
                          DropdownMenuItem(
                              value: 81,
                              child: Text('Kurdish')),
                        ],
                        onChanged: (int? value) {
                          switch(value){
                            case 22:
                              cubit.languageApi  = 'en';
                            case 163:
                              cubit.languageApi  = 'fr';
                            case 78:
                              cubit.languageApi  = 'ru';
                            case 208:
                              cubit.languageApi  = 'de';
                            case 153:
                              cubit.languageApi  = 'it';
                            case 83:
                              cubit.languageApi  = 'es';
                            case 218:
                              cubit.languageApi  = 'ja';
                            case 234:
                              cubit.languageApi  = 'ur';
                            case 81:
                              cubit.languageApi  = 'Ku';



                          }
                          cubit.chooseTranslation(value,cubit.languageApi);
                        },
                        icon: Icon(Icons.translate_outlined,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),
                      )
                  ),
                  const SizedBox(height: AppSize.s14,),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: ElevatedButton(onPressed: (){
                           if(cubit.formKey.currentState!.validate()){
                             cubit.setName();
                             cubit.setRecitationId();
                             cubit.setTranslationId();
                             cubit.setApiLanguage();
                             cubit.isFirst();
                             cubit.lastRead();
                             cubit.isDark(cubit.isDarkTheme);
                             Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>MainLayout(modeChange: cubit.isDarkTheme,)));
                           }
                        }, child:  Text('Get Started',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18,color: ColorManager.white,),))),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
