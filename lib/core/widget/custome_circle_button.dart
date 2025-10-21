import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

class CustomeCircleButton extends StatelessWidget {
   CustomeCircleButton(
      {super.key, required this.backgroundColor, required this.icons, required this.colorIcon,required this.onTap});

  final Color backgroundColor;
  final IconData icons;
  final Color colorIcon;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap:onTap ,
      child: Container(
        width: 24,
        height: 24,


        decoration: ShapeDecoration(shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100)),  color: backgroundColor,),
        child: Icon(icons, color: colorIcon, size: 17,),
      ),
    );
  }
}
