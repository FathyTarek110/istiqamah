import 'package:flutter/material.dart';
import 'package:istiqamah/core/resources/values_manager.dart';

import 'color_manager.dart';

TextFormField myTextFormField({required BuildContext context,required TextEditingController controller,required String label,IconData? iconData,Widget? suffixIcon, Widget? prefixIcon,required bool obscure,required bool enableSuggestions,required bool autoCorrect,TextInputType? textInputType,var validate,void Function(String)? onChanged,void Function()? onEditingComplete}){
  return TextFormField(
    onEditingComplete: onEditingComplete,
    onChanged: onChanged,
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconColor: ColorManager.primary,
      contentPadding:  const EdgeInsets.all(AppPadding.p16),
      label: Text(label,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),),
      hintText: 'please enter your name',
      suffixIcon: suffixIcon,
    ),
    obscureText: obscure,
    enableSuggestions: enableSuggestions,
    autocorrect: autoCorrect,
    keyboardType: textInputType,
    validator: validate,
    cursorColor: ColorManager.primary,
  );
}
