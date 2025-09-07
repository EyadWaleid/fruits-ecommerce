import 'package:flutter/material.dart';
import 'package:untitled10/features/Authentcation/presentation/SignupScreen/presentation/widget/signup_form.dart';

import '../../../../../../core/constants/spaces.dart';
import 'do_u_have_account.dart';


class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Column(
        children: [
          Text('حساب جديد',style: theme.headlineMedium,),
          MediumSpace(),
          SignupForm(),
          SmallSpace(),
          DoUHaveAccount()

          


        ],
      ),
    );
  }
}
