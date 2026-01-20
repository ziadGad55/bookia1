
import 'package:bookia1/feature/profile/data/model/EditPassRequest/EditPassRequest.dart';
import 'package:bookia1/feature/profile/data/model/EditProfileRequest/EditProfileRequest.dart';
import 'package:bookia1/feature/profile/data/model/myorderrespons/myorderrespons.dart';
import 'package:bookia1/feature/profile/data/model/userdata/userdata.dart';
import 'package:bookia1/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profilecubit_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Myorderrespons? myorderrespons;
  Userdata? userdata;

  Future<void> logout() async {
    emit(ExitLoading());
    await ProfileRepo.logout().then((value) {
      if (value == true) {
        emit(ExitLoaded());
      } else {
        emit(ExitError('error'));
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

  Future<void> Myprofile() async {
    emit(ProfileLoading());
    await ProfileRepo.Myprofile().then((value) {
      if (value != null) {
        userdata = value;
        emit(ProfileLoaded());
      } else {
        emit(ProfileError('error'));
      }
    });
  }

  Future<void> EditProfile(Editprofilerequest params) async {
    emit(ProfileLoading());

    await ProfileRepo.Editprofile(params).then((value) {
      if (value == true) {
        emit(ProfileLoaded());
      } else {
        emit(ProfileError('error'));
      }
    });
  }

  Future<void> EditPassword(EditPass params) async {
    emit(ProfileLoading());

    await ProfileRepo.EditPassword(params).then((value) {
      if (value == true) {
        emit(ProfileLoaded());
      } else {
        emit(ProfileError('error'));
      }
    });
  }
}
