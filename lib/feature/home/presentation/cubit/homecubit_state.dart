part of 'homecubit_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BestsellerLoading extends HomeState {}

final class BestsellerLoaded extends HomeState {}

final class BestsellerError extends HomeState {
  final String message;
  BestsellerError(this.message);
}

final class sliderLoading extends HomeState {}

final class sliderLoaded extends HomeState {}

final class sliderError extends HomeState {
  final String message;
  sliderError(this.message);
}

final class addWishlistcartLoading extends HomeState {}

final class addWishlistcartLoaded extends HomeState {
  final String message;
  addWishlistcartLoaded([this.message = ""]);
}

final class addWishlistcartError extends HomeState {
  final String message;
  addWishlistcartError(this.message);
}

final class AllprodactLoading extends HomeState {}

final class AllprodactLoaded extends HomeState {}

final class AllprodactError extends HomeState {
  final String message;
  AllprodactError(this.message);
}
