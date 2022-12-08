import 'package:flutter/material.dart';
import 'package:googleapis/content/v2_1.dart';

class AppStyles {
  static TextStyle bookTitleStyle =
      TextStyle(height: 1.1, fontSize: 16, fontWeight: FontWeight.w700);

  static TextStyle bookPageReadStyle =
      TextStyle(fontSize: 11, fontWeight: FontWeight.w700);

  static TextStyle getTextStyle(size, weight, color) {
    return TextStyle(
        fontFamily: "OpenSans",
        fontSize: size,
        fontWeight: weight,
        color: Color(color));
  }

  static TextStyle getChapterNameStyle(size) {
    return TextStyle(
        fontFamily: "OpenSans",
        fontSize: 11,
        fontWeight: size,
        color: Color(0xff263238));
  }

  static TextStyle getCrimsonTextStyle(size, weight, color) {
    return TextStyle(
        fontFamily: "CrimsonPro",
        fontSize: size,
        fontWeight: weight,
letterSpacing: 0.02,

        color: Color(color),);
  }
  static TextStyle getCrimsonTextItalicStyle(size, weight, color, style) {
    return TextStyle(
        fontFamily: "CrimsonPro",
        fontSize: size,
        fontWeight: weight,
letterSpacing: 0.02,
        color: Color(color),
fontStyle: style);
  }
}
