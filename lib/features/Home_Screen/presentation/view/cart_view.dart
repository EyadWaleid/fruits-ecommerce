import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/features/Home_Screen/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

import 'cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<CartItemCubit>(

        create: (context) => CartItemCubit(),
        child: CartBody(),
      ),
    );
  }
}
