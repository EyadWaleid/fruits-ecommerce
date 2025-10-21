import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/features/Home_Screen/data/domain/repo/product_repo.dart';
import 'package:untitled10/features/Home_Screen/presentation/view/product_body.dart';

import '../../../../core/cubit/product/product_cubit.dart';
import '../../../../core/services/get_it.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit(productRepo: getIt<ProductRepo>()),
      child: ProductBody(),
    );
  }
}
