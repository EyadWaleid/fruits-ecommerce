part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState{}
final class addedCart extends CartState{}
final class RemoveCartItem extends CartState{}
