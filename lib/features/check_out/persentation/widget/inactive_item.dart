import 'package:flutter/material.dart';
import 'package:untitled10/core/constants/spaces.dart';

import '../../../../core/utlis/app_colours.dart';
class InActiveProgressItem extends StatelessWidget {
  const InActiveProgressItem({super.key,required this.text,required this.number});
  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return  Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColours.grey20,
          radius: 10,

          child: FittedBox(child: Text(number,style: theme.bodySmall!.copyWith(color: Colors.black),)),
        ),
        VerySmallSpaceWidth(),

        Text(
          text,
          style: theme.bodySmall!.copyWith(
            color: AppColours.offGreyColour,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
