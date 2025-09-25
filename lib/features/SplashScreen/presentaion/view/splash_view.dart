import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/core/cache/shared_perferance.dart';
import 'package:untitled10/core/constants/keys.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/services/auth_services.dart';

import '../../../../core/utlis/generated/assets.dart';
import '../widget/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    show_next_screen();

  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return SplashBody();
  }
  show_next_screen(){
    bool isOnboardSeen=CacheHelper.getBool(key: isOnboardVisited);
    Future.delayed(Duration(seconds: 3),(){

      if(isOnboardSeen){
        var isLogged=FirebaseAuthServices().isLoggedIn();
        if(isLogged){
          Navigator.pushNamed(context, '/home');

        }
        else{
          Navigator.pushReplacementNamed(context, '/login');


        }
      }
      else{
        Navigator.pushReplacementNamed(context, '/onboard');

      }

    });}
}

