import 'package:dartz/dartz.dart';
import 'package:untitled10/core/constants/keys.dart';
import 'package:untitled10/core/entity/product_data_entity.dart';
import 'package:untitled10/core/error/faliure.dart';
import 'package:untitled10/core/model/product_data_model.dart';
import 'package:untitled10/core/services/database_service.dart';
import 'package:untitled10/features/Home_Screen/data/domain/repo/product_repo.dart';

class ProductImp implements ProductRepo{
  DatabaseService databaseService;
  ProductImp({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductDataEntity>>> getAllProducts()async {
    try {
      var data = await databaseService.getData(path: productData);
      if(data==null){
      print(data);}
      else{
        print('there is data$data');
      }
      if (data is! List) {
        print('⚠️ Data is not a list: $data');
        return right([]); // ✅ protect against wrong format
      }
      else{
      List<ProductDataEntity>product=data.map((e) => ProductDataModel.fromJson(e).toEntity()).toList();
      return right(product);}

    } on ServerFailure catch (e) {
      return left(ServerFailure(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure,List<ProductDataEntity>>> getBestProduct()async  {
 try{
   var data = await databaseService.getData(path: productData,queryParam: {
     'orderBy':'selling_count',
     'descending':true,
     'limit':5,
   }) as List<Map<String,dynamic>>;
   List<ProductDataEntity>product=data.map((e) => ProductDataModel.fromJson(e).toEntity()).toList();

   return   right(product);


} on ServerFailure catch (e) {
   return left(ServerFailure(message: e.toString()));
 }
  }
  
}