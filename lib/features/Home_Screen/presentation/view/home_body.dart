import 'package:flutter/material.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/best_selling_header.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/custome_search_home.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/feature_item.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/featured_list.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/home_app_bar.dart';

import '../widget/best_selling_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
                  BestSellingHeader(),
                  SmallSpace(),









                ],
              ),
            ),
            BestSellingBody()
          ],
        ),
      ),
    );
  }
}
