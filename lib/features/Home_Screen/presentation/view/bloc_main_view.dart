import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/widget/error_widget.dart';
import 'package:untitled10/features/Home_Screen/presentation/cubit/cart_cubit.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/productView.dart';

import 'cart_view.dart';
import 'home_view.dart';

class BlocMainView extends StatelessWidget {
   BlocMainView({
    super.key,
    required this.currentIndex,
  });

   int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
      if(state is addedCart){
         ErrorView(message: "The product has been added to the cart",);


      }
      },
      child: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          ProductView(),
          CartView(),
        ],
      ),
    );
  }
}
