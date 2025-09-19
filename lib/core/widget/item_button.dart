import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

class ItemButton extends StatelessWidget {
   ItemButton({
    super.key,
    required this.label,
    required this.colour,
   required this.onPressed,
    this.labelColour,
    this.height,
    this.width
  });
  final String label;
  final Color? colour;
  final Color? labelColour;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.sp,
      child: MaterialButton(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        onPressed: onPressed ,
        color: colour ?? Colors.white,
        child: FittedBox(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: labelColour ?? AppColours.primaryColour,
            ),
          ),
        ),
      ),
    );
  }
}
