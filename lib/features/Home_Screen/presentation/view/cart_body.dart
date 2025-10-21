import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/utlis/app_colours.dart';
import 'package:untitled10/core/widget/appButton.dart';
import 'package:untitled10/core/widget/custome_appbar.dart';
import 'package:untitled10/features/Home_Screen/data/domain/entites/cart_entity.dart';
import 'package:untitled10/features/Home_Screen/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/widget/custome_divider.dart';
import '../cubit/cart_cubit.dart';
import '../widget/cart_widgets/cart_grid_view.dart';
import '../widget/cart_widgets/detatils_banner.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cartEntity = context.read<CartCubit>().cartEntity;
    var cartWatchEntity = context.watch<CartCubit>().cartEntity;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomeAppbar(
                    context: context,
                    title: 'السلة',
                    notification: false,
                  ),
                  SmallSpace(),
                  DetatilsBanner(),
                  SmallSpace(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: Visibility(
              visible: cartEntity.cartItemEntity.isNotEmpty,
                child: CustomeDivider())),
            CartGridView(cartItems: cartEntity.cartItemEntity),
            SliverToBoxAdapter(child: Visibility(
                visible: cartEntity.cartItemEntity.isNotEmpty,

                child: CustomeDivider())),
            SliverToBoxAdapter(child: SmallSpace()),
            SliverToBoxAdapter(
              child: Visibility(
                visible: cartEntity.cartItemEntity.isNotEmpty,

                child: CustomeCartButton(cartEntity: cartEntity, cartWatchEntity: cartWatchEntity),
              ),
            ),
          ],
        ),
        /*
    Positioned(left: 0,
    bottom: 30,
    right: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppButton(label: 'الدفع  120جنيه',color:AppColours.primaryColour,),
    ))
*/
      ],
    );
  }
}

class CustomeCartButton extends StatelessWidget {
  const CustomeCartButton({
    super.key,
    required this.cartEntity,
    required this.cartWatchEntity,
  });

  final CartEntity cartEntity;
  final CartEntity cartWatchEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 30,
        top: 15,
      ),
      child: AppButton(
        label: 'الدفع ${cartEntity.totalcartPrice(cartWatchEntity.cartItemEntity)}جنيه',
        color: AppColours.primaryColour,
      ),
    );
  },
);
  }
}
