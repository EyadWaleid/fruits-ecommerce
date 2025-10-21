import 'package:dartz/dartz.dart';
import 'package:untitled10/core/entity/product_data_entity.dart';
import 'package:untitled10/core/model/product_data_model.dart';

import '../../../../../core/error/faliure.dart';

abstract class ProductRepo{
  Future<Either<Failure,List<ProductDataEntity>>>getAllProducts();
  Future<Either<Failure,List<ProductDataEntity>>>getBestProduct();
}