import 'package:flutter/material.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/cart_widgets/cart_item.dart';

import '../../../../../core/widget/custome_divider.dart';
import '../../../data/domain/entites/cart_item_entity.dart';

class CartGridView extends StatelessWidget {
  const CartGridView({super.key,required this.cartItems});
 final List<CartItemEntity> cartItems ;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => CartItem(cartItem:cartItems[index] ,),
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => SizedBox(
        width: double.infinity,
        child: CustomeDivider(),
      ),
    );
  }
}

