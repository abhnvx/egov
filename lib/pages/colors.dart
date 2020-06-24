import 'package:flutter/material.dart';

class AppColorsTheme {
  Color primarySwatch;
  Color titleBarGradientStartColor;
  Color titleBarGradientEndColor;
  Color textColor;
  Color secondaryGradientColor;

  AppColorsTheme({this.primarySwatch, this.titleBarGradientStartColor, this.titleBarGradientEndColor, this.textColor, this.secondaryGradientColor});

  static final AppColorsTheme myTheme = new AppColorsTheme(
      primarySwatch: Color(0xff3090C7),
      titleBarGradientStartColor : Color(0xff3090C7),
      titleBarGradientEndColor: Color(0xff3090C7),
      textColor: Colors.white,
      secondaryGradientColor: Colors.grey[300]
  );

}