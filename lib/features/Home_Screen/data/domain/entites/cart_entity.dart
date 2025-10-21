import 'package:untitled10/core/entity/product_data_entity.dart';
import 'package:untitled10/features/Home_Screen/data/domain/entites/cart_item_entity.dart';

class CartEntity{
  List<CartItemEntity> cartItemEntity;
  CartEntity(this.cartItemEntity);
  addCartItem(CartItemEntity cartItemEntity){
    this.cartItemEntity.add(cartItemEntity);
  }
  bool isExist(ProductDataEntity product){
    for(var cartItem in cartItemEntity) {
      if (cartItem.productDataEntity == product) {
        return true;
      }


    }        return false;

  }
  getCartItems(ProductDataEntity product){
    if(isExist(product)){
     return cartItemEntity;
    }
    else{
    return CartItemEntity(productDataEntity: product,count: 1);
    }

  }
  totalcartPrice(List<CartItemEntity> cartItemEntity){
    int total=0;

      for (var cartItem in cartItemEntity) {
         var initialValue =cartItem.totalPriceOfporduct();
         total=total+initialValue;
      }
      return total;


  }
  removeCartItem(CartItemEntity cartItemEntity){
    this.cartItemEntity.remove(cartItemEntity);

  }
}