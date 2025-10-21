import 'package:equatable/equatable.dart';
import 'package:untitled10/core/entity/product_data_entity.dart';

class  CartItemEntity extends Equatable{
  ProductDataEntity productDataEntity;
  int count;
  CartItemEntity({required this.productDataEntity, this.count=0});

  void increment() {

      count++;

  }
  void  decrement() {
    count--;
  }
  int totalPriceOfporduct(){
    return int.parse(productDataEntity.productPrice) * count;
  }
  int totalOfamountUint(){
    return productDataEntity.uintAmount * count;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productDataEntity];


}