import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';


class StyleManger {
  static TextStyle headline1({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s26,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      );

  static TextStyle headline2({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s22,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle headline3({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s16,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle headline4({
    Color color = ColorManager.primaryTextColor,
    double fontSize = FontSize.s14,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodyText({
    Color color = ColorManager.black,
    double fontSize = FontSize.s12,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );
  static TextStyle bodyText2({
    Color color = ColorManager.secondaryTextColor,
    double fontSize = FontSize.s14,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );
}
