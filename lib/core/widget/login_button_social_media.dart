import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/spaces.dart';
import '../utlis/app_colours.dart';
import '../utlis/generated/assets.dart';

class LoginButtonSocialMedia extends StatelessWidget {
  const LoginButtonSocialMedia({super.key,required this.label,required this.image,required this.function});
  final String label;
  final String image;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400.w,
        child: MaterialButton(

          onPressed:function??(){

          },
          padding: const EdgeInsets.symmetric(vertical: 20),
          elevation: 2,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(color: AppColours.boardColour,width:2)),
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(image,height: 25.h,width:25.w),
                MediumSpaceWidth(),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black,),
                  textAlign: TextAlign.center,
                ),


              ],
            ),
          ),

        )) ;;
  }
}
