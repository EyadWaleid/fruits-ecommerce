import 'package:flutter/material.dart';
import 'package:untitled10/core/utlis/theme/text_theme.dart';

class TAppTheme{
  ThemeData themeData=ThemeData(
    textTheme:TTextTheme().textTheme,
    fontFamily: "Cairo",
    useMaterial3: true,
  );
}