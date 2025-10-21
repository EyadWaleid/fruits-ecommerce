import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/widget/error_widget.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/Loading_best_selling%20.dart';

import '../../../../../core/cubit/product/product_cubit.dart';
import '../../../../../core/services/get_it.dart';
import '../../../../../core/utlis/generated/assets.dart';
import '../../../../../core/widget/loading_page.dart';
import '../../../data/domain/repo/product_repo.dart';
import 'best_selling_body.dart';

class CubitBestSellingBody extends StatelessWidget {
  const CubitBestSellingBody({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return LoadingBestSelling();
        } else if (state is ProductSuccess) {
          return BestSellingBody(products: state.porducts);
        }
        else if (state is ProductFailure) {
          return ErrorView(message: state.message);
        }
        else if (state is NetworkFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.pngNetworkError, height: 100.h, width: 100.w,),
              VerySmallSpace(),
              Text('Check the network connection', style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,)

            ],
          );
        }
        else {
          return Text('There is Something wrong ');
        }
      },
    );
  }
}

