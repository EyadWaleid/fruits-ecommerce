import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

class TTextTheme{
  TextTheme textTheme =TextTheme(
    headlineLarge: TextStyle(
        fontSize: 23.sp,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
        color: AppColours.primaryBlack),
    headlineMedium: TextStyle(
        color: AppColours.primaryBlack,

        fontSize: 19.sp,
        fontWeight: FontWeight.w700),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w700,
    ),
    bodySmall: TextStyle(
      color: AppColours.primaryGrey,
      fontSize: 13.sp,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
      height: 1.70,),
  );
}