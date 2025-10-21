import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

import '../../../../core/constants/spaces.dart';

class ShipingWidget extends StatelessWidget {
  const ShipingWidget({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.price,
    required this.title,
    required this.subTitle,
  });

  final bool isSelected;

  final void Function() onTap;
  final String title;
  final String subTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Container(
      width: 343.w,
      height: 81.h,
      padding: const EdgeInsets.only(top: 16, left: 13, right: 13, bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: isSelected == true
                ? AppColours.primaryColour
                : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(3),
                width: 18.w,
                height: 16.h,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: isSelected == false
                        ? BorderSide(width: 1.5, color: AppColours.grey400)
                        : BorderSide(color: Colors.transparent),
                  ),
                ),
                child: Visibility(
                  visible: isSelected,
                  child: CircleAvatar(
                    backgroundColor: AppColours.primaryColour,
                    radius: 1,
                  ),
                ),
              ),
            ),
            SmallSpaceWidth(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.bodySmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subTitle,
                  style: theme.bodySmall!.copyWith(color: AppColours.grey400),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                price,
                style: theme.bodySmall!.copyWith(color: AppColours.lightGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
