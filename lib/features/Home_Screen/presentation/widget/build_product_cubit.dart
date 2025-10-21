import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/widget/error_widget.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/Loading_best_selling%20.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/product_grid_body.dart';

import '../../../../core/cubit/product/product_cubit.dart';

class BuildProductCubit extends StatelessWidget {
  const BuildProductCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if(state is NetworkFailure){
          return ErrorView(message: 'Network problem');
        }
        if(state is ProductFailure){
          return ErrorView(message: state.message);
        }
        if(state is ProductLoading){
          return LoadingBestSelling();
        }
        if(state is ProductFailure){
          return ErrorView(message: state.message);
        }
        if (state is ProductSuccess) {
        return ProductGridBody(products: state.porducts);}
        else{
          return ErrorView(message: 'There is Smothing Wrong');
        }
      },
    );
  }
}
