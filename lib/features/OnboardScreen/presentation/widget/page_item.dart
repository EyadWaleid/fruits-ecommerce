import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled10/core/constants/spaces.dart';

import '../../../../core/cache/shared_perferance.dart';
import '../../../../core/constants/keys.dart';
import '../../../../core/utlis/generated/assets.dart';

class  PageviewItem extends StatelessWidget {
  const  PageviewItem({super.key,required this.backImage,required this.frontImage,required this.label,required this.description, this.currentImage});
   final String backImage;
   final String frontImage;
   final Widget label;
   final String description;
   final int? currentImage;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SizedBox(

      child: Stack(
        children: [
          SvgPicture.asset(backImage,width: width,),
          Positioned(
            top: height*0.05,
            right: width*0.05,
            child: Visibility(
              visible: currentImage==0?true:false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                TextButton(onPressed: () {
                  CacheHelper.saveData(key: isOnboardVisited, value: true);
                  Navigator.pushReplacementNamed(context, '/login');



                },child: Text('تخطي',style: Theme.of(context).textTheme.bodySmall)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
          right: 0,
          top:height*0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(frontImage),
                           MediumSpace(),
                           label,
                    SmallSpace(),

                    Text(description,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),
              )

    )],
      ),
    );
  }
}
