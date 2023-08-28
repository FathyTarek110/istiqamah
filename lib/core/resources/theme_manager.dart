import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:istiqamah/core/resources/style_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData myTheme(bool isLight,BuildContext context){
  return ThemeData(
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: ColorManager.scaffoldLight,


      appBarTheme:  Theme.of(context).appBarTheme.copyWith(
          elevation: 0,
          color: isLight ? ColorManager.scaffoldLight : ColorManager.scaffoldDark,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:isLight? ColorManager.scaffoldLight : ColorManager.scaffoldDark,
            statusBarIconBrightness:isLight? Brightness.dark : Brightness.light,
          )
      ),


    iconTheme: IconThemeData(
      color: ColorManager.textGray
    ),

    textTheme: TextTheme(
        titleMedium: getBoldStyleAmiri(color: ColorManager.souraAndIconColor, fontSize: FontSize.s20),
        bodySmall: getMediumStylePoppins(color:isLight? ColorManager.textGray : ColorManager.textGrayDark, fontSize: FontSize.s12),
        bodyMedium: getMediumStylePoppins(color:isLight? ColorManager.textMediumLight : ColorManager.scaffoldLight, fontSize: FontSize.s16),
        bodyLarge: getSemiBoldStyle(color: isLight? ColorManager.textMediumLight : ColorManager.scaffoldLight, fontSize: FontSize.s24)
    ),

    cardTheme: CardTheme(

        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        color: ColorManager.primary

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.secondaryColor,
            disabledBackgroundColor: ColorManager.textGray,
            shape:  const StadiumBorder()
        )
    ),

    buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),buttonColor: ColorManager.secondaryColor,
        disabledColor: ColorManager.textGray
    ),


    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.mediumGray, fontSize: FontSize.s14),
        labelStyle: getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGray,
            width: AppSize.s1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGray,
            width: AppSize.s1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.red,
            width: AppSize.s1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.red,
            width: AppSize.s1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

        )
    ),



      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme:IconThemeData(
              color: ColorManager.primary
          ),
          backgroundColor:isLight? ColorManager.scaffoldLight : ColorManager.scaffoldDark,
          elevation: AppSize.s4
      )


  );

}