import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/features/OnboardScreen/presentation/widget/page_item.dart';

import '../../../../core/utlis/app_colours.dart';
import '../../../../core/utlis/generated/assets.dart';

class PageviewOnboard extends StatelessWidget {
  const PageviewOnboard({super.key,required this.pageViewController});
  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: [
        PageviewItem(backImage: Assets.svgVector,
            currentImage: pageViewController.hasClients?pageViewController.page?.round():0,
            frontImage: Assets.pngFruit_basketAmico,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text( 'مرحبًا بك في',style: Theme.of(context).textTheme.headlineLarge,),
                Text( 'hub',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColours.primaryOrange),),
               Text( 'Fruit', style: Theme.of(context).textTheme.headlineLarge,),

              ],
            ),
            description: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'),
        PageviewItem(
            currentImage: pageViewController.hasClients?pageViewController.page?.round():0,

            backImage: Assets.svgVector_1,
            frontImage: Assets.pngPineappleCuate,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text( 'ابحث وتسوق',style: Theme.of(context).textTheme.headlineLarge,),
              ],
            ),
            description: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'),
      ],
    );
  }
}
