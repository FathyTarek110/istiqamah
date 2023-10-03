import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/font_manager.dart';
import 'package:istiqamah/core/resources/reusable_components.dart';

import '../../../../core/resources/routes_manager.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myTextFormField(context: context, controller: cubit.nameTextEditingController, label: 'Name', obscure: false, enableSuggestions: false, autoCorrect: false,validate: (value){
                  if(value.isEmpty){
                    return 'name can\'t be empty' ;
                  }
                }),
                const SizedBox(height: AppSize.s14,),
                SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: ElevatedButton(onPressed: (){
                       cubit.setName();
                      cubit.isFirst();
                      Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
                    }, child:  Text('Get Started',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s18,color: ColorManager.white),)))

              ],
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
