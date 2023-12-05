import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:istiqamah/core/resources/style_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData myTheme(bool isLight,BuildContext context){
  return ThemeData(
    brightness: Brightness.light,
      primaryColor: ColorManager.primaryLight,
      scaffoldBackgroundColor: isLight ? ColorManager.white : ColorManager.scaffoldDark,


      appBarTheme:  Theme.of(context).appBarTheme.copyWith(
          elevation: 0,
          color: isLight ? ColorManager.white : ColorManager.scaffoldDark,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:isLight? ColorManager.white : ColorManager.scaffoldDark,
            statusBarIconBrightness:isLight? Brightness.dark : Brightness.light,
          )
      ),


    iconTheme: IconThemeData(
      color: ColorManager.textGray
    ),

    textTheme: TextTheme(
        titleMedium: getBoldStyleAmiri(color: ColorManager.souraAndIconColor, fontSize: FontSize.s20),
        bodySmall: getMediumStylePoppins(color:isLight? ColorManager.textGray : ColorManager.textGrayDark, fontSize: FontSize.s12),
        bodyMedium: getMediumStylePoppins(color:isLight? ColorManager.textMediumLight : ColorManager.white, fontSize: FontSize.s16),
        bodyLarge: getSemiBoldStyle(color: isLight? ColorManager.textMediumLight : ColorManager.white, fontSize: FontSize.s24)
    ),

    cardTheme: CardTheme(

        elevation: AppSize.s1_5,

        color: ColorManager.white

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.secondaryColor,
            disabledBackgroundColor: ColorManager.textGray,
            shape:  const StadiumBorder()
        )
    ),

    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),buttonColor: ColorManager.secondaryColor,
        disabledColor: ColorManager.textGray
    ),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
        labelStyle: getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primaryLight,
            width: AppSize.s1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primaryLight,
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
              color: ColorManager.primaryLight
          ),
          backgroundColor:isLight? ColorManager.white : ColorManager.scaffoldDark,
          elevation: AppSize.s4
      )


  );

}

ThemeData darkTheme(bool isLight,BuildContext context){
  return ThemeData(
    brightness: Brightness.dark,
      primaryColor: ColorManager.primaryDark,
      scaffoldBackgroundColor: ColorManager.scaffoldDark,


      appBarTheme:  Theme.of(context).appBarTheme.copyWith(
          elevation: 0,
          color: isLight ? ColorManager.white : ColorManager.scaffoldDark,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:isLight? ColorManager.white : ColorManager.scaffoldDark,
            statusBarIconBrightness:isLight? Brightness.dark : Brightness.light,
          )
      ),


      iconTheme: IconThemeData(
          color: ColorManager.textGray
      ),

      textTheme: TextTheme(
          titleMedium: getBoldStyleAmiri(color: ColorManager.souraAndIconColor, fontSize: FontSize.s20),
          bodySmall: getMediumStylePoppins(color:isLight? ColorManager.textGray : ColorManager.textGrayDark, fontSize: FontSize.s12),
          bodyMedium: getMediumStylePoppins(color:isLight? ColorManager.textMediumLight : ColorManager.white, fontSize: FontSize.s16),
          bodyLarge: getSemiBoldStyle(color: isLight? ColorManager.textMediumLight : ColorManager.white, fontSize: FontSize.s24)
      ),

      cardTheme: CardTheme(

          elevation: AppSize.s1_5,

          color: ColorManager.scaffoldDark

      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.secondaryColor,
              disabledBackgroundColor: ColorManager.textGray,
              shape:  const StadiumBorder()
          )
      ),

      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),buttonColor: ColorManager.secondaryColor,
          disabledColor: ColorManager.textGray
      ),

      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
          labelStyle: getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14),
          errorStyle: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
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
              color: ColorManager.primaryDark
          ),
          backgroundColor:isLight? ColorManager.white : ColorManager.scaffoldDark,
          elevation: AppSize.s4
      )


  );

}