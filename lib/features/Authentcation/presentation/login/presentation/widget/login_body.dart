import 'package:flutter/material.dart';
import '../../../../../../core/constants/spaces.dart';
import 'login_footer.dart';
import 'login_form.dart';
class LoginBody extends StatelessWidget {
   const LoginBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal:20),
      child: Column(
        children: [
          Text('تسجيل دخول',style: theme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),),
          MediumSpace(),

          LoginForm(),
          MediumSpace(),
          LoginFooter()

        ],
      ),
    );
  }
}


