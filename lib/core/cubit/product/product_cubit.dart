import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:untitled10/core/entity/product_data_entity.dart';
import 'package:untitled10/features/Home_Screen/data/domain/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit( {required this.productRepo}) : super(ProductInitial());
  ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    final bool isConnected = await InternetConnectionChecker.instance
        .hasConnection;
    if (isConnected) {
      var res = await productRepo.getBestProduct();
      res.fold(
            (l) => emit(ProductFailure(l.message)),
            (products) => emit(ProductSuccess(products)),
      );
    }
    else {
      emit(NetworkFailure());
    }
    }
    Future<void> getAllProducts() async {

      emit(ProductLoading());
      final bool isConnected = await InternetConnectionChecker.instance
          .hasConnection;
      if (isConnected) {
        var res = await productRepo.getAllProducts();
        res.fold(
              (l) => emit(ProductFailure(l.message)),
              (products) => emit(ProductSuccess(products)),
        );
      }
    }
  }


