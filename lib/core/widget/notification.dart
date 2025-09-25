import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

import '../utlis/generated/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: SvgPicture.asset(Assets.svgNotification),
      backgroundColor:AppColours.lightGreen ,
      radius:34.sp,
    );
  }
}
