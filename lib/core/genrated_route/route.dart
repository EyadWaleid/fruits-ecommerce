import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/home_view.dart';
import 'package:untitled10/features/OnboardScreen/presentation/view/onboard_view.dart';
import '../../features/Authentcation/presentation/SignupScreen/presentation/view/signup_view.dart';
import '../../features/Authentcation/presentation/login/presentation/view/login_view.dart';
import '../../features/SplashScreen/presentaion/view/splash_view.dart';

class AppRoute{
  Route? onGenarate(RouteSettings settings){
    switch(settings.name) {
      case('/'):
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case('/onboard'):
        return MaterialPageRoute(builder: (_)=> const OnboardView());
      case('/login'):
        return MaterialPageRoute(builder: (_)=>  LoginView());
      case('/sign_up'):
        return MaterialPageRoute(builder: (_)=>  SignupView());
      case('/home'):
         return MaterialPageRoute(builder: (context) =>HomeView(),)  ;



    }
    return null;
  }

}