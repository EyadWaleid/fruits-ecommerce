import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/cart_view.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/productView.dart';
import '../cubit/cart_cubit.dart';
import '../widget/bottom_navigation_bar/custome_navigation_ bar.dart';
import 'bloc_main_view.dart';
import 'home_view.dart';
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currenrtIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: Scaffold(
          bottomNavigationBar: CustomeNavigationBar(onItemTapped: (int value) {
            setState(() {
              currenrtIndex = value;
            });
          },),
          body: SafeArea(child: BlocMainView(currentIndex: currenrtIndex)
          )
      ),
    );
  }

}




