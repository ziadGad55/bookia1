part of 'wishlist_cubit_cubit.dart';

sealed class WishlistCubitState {}

final class WishlistCubitInitial extends WishlistCubitState {}

final class WishlistCubitLoading extends WishlistCubitState {}

final class WishlistCubitSuccess extends WishlistCubitState {}

final class WishlistCubitError extends WishlistCubitState {
  final String message;
  WishlistCubitError(this.message);
}

final class cartCubitLoading extends WishlistCubitState {}

final class cartCubitSuccess extends WishlistCubitState {}

final class cartCubitError extends WishlistCubitState {
  final String message;
  cartCubitError(this.message);
}
