import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled10/features/Home_Screen/data/domain/entites/cart_item_entity.dart';

import '../../../../core/entity/product_data_entity.dart';
import '../../data/domain/entites/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity=CartEntity([]);
  addProduct(ProductDataEntity product){
    bool isExist=cartEntity.isExist(product);
    CartItemEntity cartItemEntity =cartEntity.getCartItems(product);
    if(isExist){
      cartItemEntity.increment();

      }
    else{


      cartEntity.addCartItem(CartItemEntity(productDataEntity: product,count: 1 ));

      emit(addedCart());

    }

    }
  removeProduct(CartItemEntity product){
    cartEntity.removeCartItem(product );
    emit(RemoveCartItem());
  }

  }


