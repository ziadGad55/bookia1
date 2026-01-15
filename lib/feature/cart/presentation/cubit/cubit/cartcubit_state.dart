part of 'cartcubit_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {}

final class CheckoutLoaded extends CartState {
   final String total;

  CheckoutLoaded(this.total);
}

final class CheckoutLoading extends CartState {}


final class CartError extends CartState {
  final String massage;
  CartError(this.massage);
}
