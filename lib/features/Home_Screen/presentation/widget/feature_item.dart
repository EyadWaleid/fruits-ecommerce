import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/utlis/app_colours.dart';
import 'package:untitled10/core/widget/item_button.dart';
import '../../../../core/utlis/generated/assets.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    var itemHeight = MediaQuery.of(context).size.height;
    var theme=Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius:  BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(right: itemWidth*0.3,
                child: SizedBox(
                width: itemWidth*0.6,
                height: itemHeight*0.2,

                  child: Image.asset(Assets.fruits,fit: BoxFit.fill,)),),
              Positioned(
                child: Container(
                  width: itemWidth * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: svg.Svg(Assets.svgEllipse224),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25.sp),
                        Text(
                          'عروض العيد ',
                          style: theme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'خصم 25%',
                          style: theme.labelLarge,
                        ),
                        VerySmallSpace(),

                        ItemButton(
                          label: 'تسوق الأن',
                          colour: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(height: 29.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
