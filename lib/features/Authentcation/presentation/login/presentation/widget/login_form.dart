import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/spaces.dart';
import '../../../../../../core/utlis/app_colours.dart';
import '../../../../../../core/widget/TextField.dart';
import '../../../../../../core/widget/appButton.dart';
import '../../../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,

  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier <bool> isObscure=ValueNotifier(true);

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;

    return Form(
      key:formKey ,
      child: Column(
        children: [
          FormBox(
            isFilled:true ,
            labeled: 'البريد الألكتروني',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          SmallSpace(),
          ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              return FormBox(
                isFilled: true,
                isObscured: isObscure.value,
                labeled: 'كلمة المرور',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon:IconButton(onPressed: (){
                  isObscure.value =!isObscure.value;
                }, icon: Icon(Icons.remove_red_eye)),
              );
            }
          ),
          VerySmallSpace(),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('نسيت كلمة المرور؟',style:theme.bodySmall!.copyWith(color: AppColours.primaryColour),textAlign: TextAlign.end,)
              ],
            ),
          ),
          MediumSpace(),
          AppButton(
            label: 'تسجيل دخول',
            function: () {
              if(formKey.currentState!.validate()){
                context.read<LoginCubit>().login(emailController.text, passwordController.text);

              }
            },

          )
        ],
      ),
    );
  }
}
