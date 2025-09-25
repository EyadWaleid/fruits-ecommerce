import 'package:flutter/material.dart';

import '../widget/bottom_navigation_bar/custome_navigation_ bar.dart';
import 'home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: CustomeNavigationBar(),
      backgroundColor: Colors.white,
      body: HomeBody(),
    );
  }
}
