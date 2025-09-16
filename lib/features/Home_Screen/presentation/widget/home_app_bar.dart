import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utlis/generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:SvgPicture.asset(Assets.svgMask_group),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF949D9E) /* Grayscale-400 */,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing:Container(
        width:34,
        height: 34,
        decoration: ShapeDecoration(shape: OvalBorder(),color: Color(0xfffeef8ed)),
        child: SvgPicture.asset(Assets.notification,fit: BoxFit.fill,),),
    );


      


  }
}
