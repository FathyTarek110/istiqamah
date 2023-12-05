import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/quran/presentation/controller/settings_cubit/setting_cubit.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/reusable_components.dart';
import '../../../../../core/resources/values_manager.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SettingCubit(),
  child: BlocConsumer<SettingCubit, SettingState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    SettingCubit cubit = SettingCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color:Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,)),
      ),
      body: Form(
        key: cubit.formKey,
        child: Center(
          child: Padding(
            padding:   const EdgeInsets.all(AppPadding.p16),
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
                  myTextFormField(context: context, controller: cubit.nameTextEditingController, label: 'change Name', obscure: false, enableSuggestions: false, autoCorrect: false,validate: (value){

                  }, hintText: cubit.name, color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),
                  const SizedBox(height: AppSize.s10,),
                  Text('change reciter :',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),),
                  const SizedBox(height: AppSize.s10,),
                  SizedBox(
                      width: double.infinity,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: cubit.recitationId,
                        items:  [
                          DropdownMenuItem(
                              value: 12,
                              child: Text('Mahmoud Khalil Al-Husary / محمود خليل ',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 11,
                              child: Text('Mohamed al-Tablawi / محمد الطبلاوي',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                        ],
                        onChanged: (int? value) {
                          cubit.chooseRecitation(value);
                        },
                        icon: Icon(Icons.record_voice_over_outlined,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),
                      )
                  ),
                  const SizedBox(height: AppSize.s10,),
                  Text('change holy quran translation  :',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),),
                  const SizedBox(height: AppSize.s10,),

                  SizedBox(
                      width: double.infinity,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: cubit.translationId,
                        items:  [
                          DropdownMenuItem(
                              value: 22,
                              child: Text('English',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),

                          DropdownMenuItem(
                              value: 78,
                              child: Text('Russian',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),

                          DropdownMenuItem(
                              value: 136,
                              child: Text('French',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 208,
                              child: Text('German',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 153,
                              child: Text('Italian',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 83,
                              child: Text('Spanish',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 218,
                              child: Text('Japanese',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 234,
                              child: Text('Urdu',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
                          DropdownMenuItem(
                              value: 81,
                              child: Text('Kurdish',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white),)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(onPressed: (){
                            if(cubit.formKey.currentState!.validate()){
                              if(cubit.nameTextEditingController.value.text.length > 2){
                                cubit.setName();
                              }
                              cubit.setRecitationId();
                              cubit.setTranslationId();
                              cubit.setApiLanguage();
                              openDialouge(context);
                              cubit.changeMode(cubit.isDarkTheme);

                            }
                          }, child:  Text('save',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18,color: ColorManager.white),)),
                        ),
                        const SizedBox(width: AppSize.s14,),
                        Expanded(
                          child: ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child:  Text('cancel',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18,color: ColorManager.white),)),
                        ),
                      ],
                    ),
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
  Future openDialouge(context)=>showDialog(context: context, builder: (context)=> AlertDialog(
    title: const Text('the app will restart'),
    actions: [
      TextButton(onPressed: (){
        Restart.restartApp(webOrigin: '/main_layout.dart');
      }, child:  Text('restart',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),)),
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child:  Text('cancel',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,),))
    ],
  ));
}
