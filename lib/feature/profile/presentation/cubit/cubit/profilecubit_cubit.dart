import 'package:bookia1/feature/profile/data/model/myorderrespons/myorderrespons.dart';
import 'package:bookia1/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profilecubit_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Myorderrespons? myorderrespons;

  Future<void> logout() async {
    emit(ProfileLoading());
    await ProfileRepo.logout().then((value) {
      if (value == true) {
        emit(ProfileLoaded());
      } else {
        emit(ProfileError('error'));
      }
    });
  }



  Future<void> Myorder() async {
    emit(ProfileLoading());
    await ProfileRepo.Myorder().then((value) {
      if (value != null) {
        myorderrespons = value;
        emit(ProfileLoaded());
      } else {
        emit(ProfileError('error'));
      }
    });
  }
}
