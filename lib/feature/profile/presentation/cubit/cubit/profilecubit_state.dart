part of 'profilecubit_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

final class ExitLoading extends ProfileState {}

final class ExitLoaded extends ProfileState {}

final class ExitError extends ProfileState {
  final String message;
  ExitError(this.message);
}
