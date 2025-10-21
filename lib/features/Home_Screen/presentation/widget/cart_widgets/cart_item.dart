import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/widget/custome_circle_button.dart';
import 'package:untitled10/features/Home_Screen/data/domain/entites/cart_item_entity.dart';
import 'package:untitled10/features/Home_Screen/presentation/cubit/cart_cubit.dart';
import 'package:untitled10/features/Home_Screen/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/utlis/app_colours.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key,required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if(current is CartItemUpdated){
          if(current.cartItemEntity ==cartItem){
            return true;
          }

        }

          return false;



      },
      builder: (context, state) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(left:15),
        child: Row(
          children: [
            Container(
              width: 73.w,
              height: 92.h,
              decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
              child:Image.network(cartItem.productDataEntity.productImage??"") ,

            ),
            SmallSpaceWidth(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(cartItem.productDataEntity.productName,style:theme.labelSmall!.copyWith(color:Colors.black,fontWeight: FontWeight.bold) ,),
                      Spacer(),
                      IconButton(onPressed: () {
                        context.watch<CartCubit>().removeProduct(cartItem);

                      }, icon: Icon(Icons.delete,color: AppColours.grey400,))
                    ],
                  ),
                  Text('${cartItem.totalOfamountUint()} كيلو',style: theme.labelSmall!.copyWith(color: AppColours.lightOrange,),),
                  SmallSpace(),
                  Row(
                    children: [
                      CustomeCircleButton(backgroundColor: AppColours.primaryColour, icons: Icons.add, colorIcon: Colors.white, onTap: () {
                        cartItem.increment();
                        context.read<CartItemCubit>().updateCartItem(cartItem);

                      },),
                      SmallSpaceWidth(),
                      Text('${cartItem.count}',style: theme.labelMedium!.copyWith(fontWeight: FontWeight.bold,fontSize:16.sp),),
                      SmallSpaceWidth(),

                      CustomeCircleButton(backgroundColor: AppColours.cardColour, icons: Icons.remove, colorIcon: AppColours.grey400,onTap: () {
                        cartItem.decrement();
                        context.read<CartItemCubit>().updateCartItem(cartItem);

                      },),
                      Spacer(),
                      Text("${cartItem.totalPriceOfporduct()} جنية",style: theme.labelMedium!.copyWith(color: AppColours.lightOrange,fontWeight: FontWeight.bold,fontSize:16.sp),)



                    ],
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  },
);
  }
}
