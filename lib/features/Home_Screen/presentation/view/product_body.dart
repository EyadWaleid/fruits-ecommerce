import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/cubit/product/product_cubit.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/widget/custome_appbar.dart';
import '../widget/best_selling/best_selling_header.dart';
import '../widget/build_product_cubit.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomeAppbar(context: context, title: 'منتجات'),
                  SmallSpace(),
                  SmallSpace(),
                  CustomeHeader(header: 'جميع المنتجات',),
                  SmallSpace(),
                ],
              ),
            ),
            BuildProductCubit ()


          ],
        ),
      ),
    );
  }
}
