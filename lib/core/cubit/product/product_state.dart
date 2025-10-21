part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List <ProductDataEntity>porducts;
  ProductSuccess(this.porducts);
}
final class ProductFailure extends ProductState {
  ProductFailure(this.message);
  final String message;
}
final class NetworkFailure extends ProductState {}

