import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/main_view.dart';
import 'package:untitled10/features/OnboardScreen/presentation/view/onboard_view.dart';
import 'package:untitled10/features/check_out/persentation/view/check_out_view.dart';
import '../../features/Authentcation/presentation/SignupScreen/presentation/view/signup_view.dart';
import '../../features/Authentcation/presentation/login/presentation/view/login_view.dart';

class AppRoute{
  Route? onGenarate(RouteSettings settings){
    switch(settings.name) {
      case('/'):
        return MaterialPageRoute(builder: (_)=> const CheckOutView());
      case('/onboard'):
        return MaterialPageRoute(builder: (_)=> const OnboardView());
      case('/login'):
        return MaterialPageRoute(builder: (_)=>  LoginView());
      case('/sign_up'):
        return MaterialPageRoute(builder: (_)=>  SignupView());
      case('/home'):
         return MaterialPageRoute(builder: (context) =>MainView(),)  ;



    }
    return null;
  }

}