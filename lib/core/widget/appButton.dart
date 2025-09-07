import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';
class AppButton extends StatelessWidget {
  String label;
  Color? color;
  Color? textColor;
  double?width;
  bool border;
  bool isImage;
  String?image;


  void Function()? function;
   AppButton({super.key,required this.label,this.color,this.function,this.width,this.border=false,this.textColor,this.isImage=false,this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width??400.w,
        child: MaterialButton(

            onPressed:function??(){

            },
            padding: const EdgeInsets.symmetric(vertical: 20),
            elevation: 2,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: border?BorderSide(color: AppColours.primaryColour,width:2):BorderSide.none),
          color:AppColours.primaryColour,
            child:
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color:textColor?? Colors.white),
                  ),

                  isImage==false?const SizedBox(height:1,width: 1,):Image.asset(image!,height: 25.h,width:25.w,),

                ],
              ),
            ),

        )) ;
  }
}