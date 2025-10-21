import 'package:flutter/material.dart';

import '../../../../core/entity/product_data_entity.dart';
import 'fruit_item.dart';

class ProductGridBody extends StatelessWidget {
  const ProductGridBody({super.key, required this.products});

  final List<ProductDataEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 163 / 220,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => FruitItem(product: products[index],),
    );
  }
}