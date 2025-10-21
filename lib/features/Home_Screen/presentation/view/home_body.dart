import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/custome_search_home.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/featured_list.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/home_app_bar.dart';
import '../../../../core/cubit/product/product_cubit.dart';
import '../widget/best_selling/best_selling_body.dart';
import '../widget/best_selling/best_selling_header.dart';
import '../widget/best_selling/cubit_best_selling_body.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeAppBar(),
                  SmallSpace(),
                  CustomeSearchHome(searchController: TextEditingController()),
                  SmallSpace(),
                  FeaturedList(),
                  SmallSpace(),
                  CustomeHeader(header: 'الأكثر مبيعًا',),
                  SmallSpace(),
                ],
              ),
           ),
            CubitBestSellingBody(),
          ],
        ),
      ),
    );
  }
}
