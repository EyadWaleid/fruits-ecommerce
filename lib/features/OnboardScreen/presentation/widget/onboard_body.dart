import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/core/cache/shared_perferance.dart';
import 'package:untitled10/core/constants/keys.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/utlis/app_colours.dart';
import 'package:untitled10/core/widget/appButton.dart';
import 'package:untitled10/features/OnboardScreen/presentation/widget/pageview.dart';

class OnboardBody extends StatefulWidget {
  const OnboardBody({super.key});

  @override
  State<OnboardBody> createState() => _OnboardBodyState();
}

class _OnboardBodyState extends State<OnboardBody> {
 late PageController pageViewController;
 int currentImage=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController=PageController();
    pageViewController.addListener((){
      currentImage=pageViewController.hasClients?pageViewController.page!.round():0;
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0,120 ),
      child: Column(
        children: [
          Expanded(child: PageviewOnboard(pageViewController: pageViewController,)),
          DotsIndicator(dotsCount: 2,
            decorator: DotsDecorator(
              activeColor:AppColours.primaryColour,
              color: currentImage==0?AppColours.primaryColour.withOpacity(0.5):AppColours.primaryColour
            ),
          ),
          VerySmallSpace(),
          Visibility(
            visible: currentImage==0?false:true,
            child: Padding(
             padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: AppButton(label: 'ابدأ الان',function: () {
              Navigator.pushReplacementNamed(context, '/login');
              CacheHelper.saveData(key: isOnboardVisited, value: true);
            },)),
          ),


        ],
      ),
    );
  }
}
