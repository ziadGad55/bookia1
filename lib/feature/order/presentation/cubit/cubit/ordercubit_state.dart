part of 'ordercubit_cubit.dart';

sealed class OrdercubitState {}

final class OrdercubitInitial extends OrdercubitState {}

final class OrderLoading extends OrdercubitState {}

final class OrderLoaded extends OrdercubitState {}

final class OrderError extends OrdercubitState {
  final String error;
  OrderError(this.error);
}
