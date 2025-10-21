import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/cubit/product/product_cubit.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/productView.dart';

import '../../../../core/services/get_it.dart';
import '../../data/domain/repo/product_repo.dart';
import '../widget/bottom_navigation_bar/custome_navigation_ bar.dart';
import 'home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
*/
      backgroundColor: Colors.white,
      body: BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(productRepo: getIt<ProductRepo>()),
        child: HomeBody(),
      ),
    );
  }


  }


