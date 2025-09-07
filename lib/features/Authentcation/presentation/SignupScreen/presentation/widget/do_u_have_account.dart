import 'package:flutter/material.dart';

import '../../../../../../core/utlis/app_colours.dart';


class DoUHaveAccount extends StatelessWidget {
  const DoUHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('تمتلك حساب بالفعل ؟',style:theme.labelSmall!.copyWith(color: AppColours.grey400)),
        TextButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');

        }, child: Text('تسجيل دخول',style:theme.labelSmall!.copyWith(color: AppColours.primaryColour)))
      ],
    );
  }
}
