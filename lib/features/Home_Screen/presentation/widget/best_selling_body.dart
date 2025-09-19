import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'fruit_item.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      crossAxisSpacing:16 ,
      mainAxisSpacing:8,
      childAspectRatio: 163/220),
      itemBuilder: (context, index) => FruitItem(),);
  }
}
