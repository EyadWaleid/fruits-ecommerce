import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utlis/app_colours.dart';
import '../../cubit/cart_cubit.dart';

class DetatilsBanner extends StatelessWidget {
  const DetatilsBanner ({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Container(
      height: 41.h,
      width: double.infinity,
        decoration: BoxDecoration(
        color: AppColours.lightGreen,
    ),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('لديك',textAlign: TextAlign.center,style: theme.labelMedium?.copyWith(color: AppColours.primaryColour,fontSize: 16.sp)),
          Text(' ${context.read<CartCubit>().cartEntity.cartItemEntity.length} ',textAlign: TextAlign.center,style: theme.labelMedium?.copyWith(color: AppColours.primaryColour,fontSize: 16.sp)),
          Text('منتجات في السله التسوق ',textAlign: TextAlign.center,style: theme.labelMedium?.copyWith(color: AppColours.primaryColour,fontSize: 16.sp),),
        ],
      ))
    );
  }
}
