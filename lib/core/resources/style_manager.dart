import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle? _getTextStyle( double fontSize,String fontFamily,FontWeight fontWeight,Color color){
  return TextStyle(color: color ,fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize);
}


TextStyle? getRegularStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize ,FontConstants.poppins ,FontWeightManager.regular, color,);
}

TextStyle? getMediumStylePoppins({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.poppins , FontWeightManager.medium, color,);
}

TextStyle? getSemiBoldStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.poppins , FontWeightManager.bold, color,);
}
TextStyle? getBoldStyleAmiri({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.amiri , FontWeightManager.bold, color,);
}