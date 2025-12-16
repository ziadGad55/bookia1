import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia1/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        appdata.cashdata(appdata.usertoken, value.data?.token);

        emit(AuthSuccess());
      } else {
        emit(AuthError(error: "something went wrong"));
      }
    });
  }

  register(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        appdata.cashdata(appdata.usertoken, value.data?.token);

        emit(AuthSuccess());
      } else {
        emit(AuthError(error: "something went wrong   "));
      }
    });
  }

  forgot_password(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.forgot_password(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(error: "something went wrong"));
      }
    });
  }

  otp(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.otp(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(error: "something went wrong"));
      }
    });
  }

  newpass(AuthParams params) {
    emit(AuthLoading());
    AuthRepo.newpass(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(error: "something went wrong"));
      }
    });
  }

  resend(AuthParams params) {
    AuthRepo.resend(params);
  }
}
