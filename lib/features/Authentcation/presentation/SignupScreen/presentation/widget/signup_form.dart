import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/widget/appButton.dart';
import 'package:untitled10/features/Authentcation/presentation/cubit/signup_cubit.dart';

import '../../../../../../core/utlis/app_colours.dart';
import '../../../../../../core/widget/TextField.dart';

class SignupForm extends StatefulWidget {
  SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  var formkey = GlobalKey<FormState>();
  ValueNotifier <bool> isObscure=ValueNotifier(true);
  ValueNotifier <bool> isTrue=ValueNotifier(false);
  ValueNotifier <bool> isError=ValueNotifier(false);


  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          FormBox(
            labeled: 'الاسم كامل',
            controller: nameController,
            isFilled: true,
            validator: (p0) {
              if(p0!.isEmpty){
                return 'Fill this information';}
            },
          ),
          SmallSpace(),
          FormBox(
            labeled: 'البريد الألكتروني',
            controller: emailController,
            isFilled: true,
            validator: (p0) {
              if(p0!.isEmpty){
                return 'Fill this information';}

            },
          ),
          SmallSpace(),
          ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (BuildContext context, value, Widget? child) {
             return FormBox(
                isObscured: isObscure.value,
                labeled: 'كلمة المرور',validator: (p0) {
                if(p0!.isEmpty){
                  return 'Fill this information';}
                if(p0.length<6){
                  return 'the password must be more than 6 element';
                }
              },
                controller: passwordController,
                isFilled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    isObscure.value =!isObscure.value;
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              );
            },

          ),
          SmallSpace(),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable:isTrue ,
                builder: (context, value, child) {
                  return Checkbox(value: isTrue.value, onChanged: (value) {
                    isTrue.value=!isTrue.value;
                  },
                    activeColor: AppColours.primaryColour,
                    shape:isTrue.value? null:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(color: Colors.red))  ,
                  );
                }
              ),
              SmallSpaceWidth(),
              SizedBox(
                width: width * 0.73,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                        style: theme.bodySmall!.copyWith(
                          color: AppColours.grey400,
                        ),
                      ),
                      TextSpan(
                        text: 'الشروط والأحكام الخاصة بنا',
                        style: theme.bodySmall!.copyWith(
                          color: AppColours.secoundaryColour,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SmallSpace(),
          AppButton(
            label: 'إنشاء حساب جديد',
            function: () {
              if(isTrue.value==true){
              if(formkey.currentState!.validate()) {
                context
                    .read<SignupCubit>()
                    .signup(emailController.text, passwordController.text,nameController.text);
                setState(() {
                  autovalidateMode=AutovalidateMode.always;

                });
              }}
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('وافق علي الشروط ')));
              }

            }


          ),
        ],
      ),
    );
  }
}
