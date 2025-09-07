import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/utlis/generated/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              SvgPicture.asset(Assets.svgFreepikPlantInject63,),
              MediumSpace(),
              MediumSpace(),
              MediumSpace(),
              Center(child: Image.asset(Assets.iconIcon,width: width*0.7,
                )),
              Spacer(),
              SvgPicture.asset(Assets.svgFreepikCirclesInject5Cleaned,width:width*0.95 ,)

            ],
          ),
        ),
      ),
    );
  }
}
