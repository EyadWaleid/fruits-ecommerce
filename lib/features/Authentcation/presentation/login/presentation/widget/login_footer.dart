import 'package:flutter/material.dart';

import '../../../../../../core/constants/spaces.dart';
import '../../../../../../core/utlis/app_colours.dart';
import '../../../../../../core/utlis/generated/assets.dart';
import '../../../../../../core/widget/login_button_social_media.dart';


class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('لا تمتلك حساب ؟',style:theme.labelSmall!.copyWith(color: AppColours.grey400)),
            TextButton(onPressed: (){
              Navigator.pushReplacementNamed(context,'/sign_up');
            }, child:  Text('قم بانشاء حساب',style:theme.labelSmall!.copyWith(color: AppColours.primaryColour)),),

          ],
        ),
        MediumSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: Divider(color: AppColours.divederColour,thickness: 1,),
              ),
            ),
            MediumSpaceWidth(),
            Text('او',style: theme.labelSmall!.copyWith(color: Colors.black),),
            MediumSpaceWidth(),

            Expanded(
              child: SizedBox(
                child: Divider(color: AppColours.divederColour,thickness: 1,),
              ),
            ),
          ],
        ),
        SmallSpace(),
        LoginButtonSocialMedia(label: 'تسجيل الدخول بواسطة جوجل', image: Assets.pngSocial_Icons, function: () {
          Navigator.pushNamed(context, '/login');
        },),
        VerySmallSpace(),
        LoginButtonSocialMedia(label: 'تسجيل الدخول بواسطة أبل', image: Assets.pngVector, function: () {
          Navigator.pushNamed(context, '/login');
        },),
        VerySmallSpace(),
        LoginButtonSocialMedia(label: 'تسجيل الدخول بواسطة فيسبوك ', image: Assets.pngFacebook, function: () {
          Navigator.pushNamed(context, '/login');
        },)
      ],
    );
  }
}
