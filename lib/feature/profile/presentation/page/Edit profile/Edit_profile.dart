import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/profile/data/model/EditProfileRequest/EditProfileRequest.dart';
import 'package:bookia1/feature/profile/presentation/cubit/cubit/profilecubit_cubit.dart';
import 'package:bookia1/feature/profile/presentation/page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController Addresscontroller = TextEditingController();

  final TextEditingController Phonecontroller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    Addresscontroller.dispose();
    Phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (state is ProfileError) {
            Navigator.pop(context);
            errortoast(state.message, context);
          } else if (state is ProfileLoading) {
            loading(context);
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: back_arrow(context),
              actions: [
                Text(
                  'Edit Profile',
                  style: appTextStyle(size: 25),
                ),
                SizedBox(
                  width: 135,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: Phonecontroller,
                    decoration: InputDecoration(
                      hintText: "phone",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: Addresscontroller,
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return buttom(
                        text: "Update Profile",
                        onPressed: () {
                          context.read<ProfileCubit>().EditProfile(
                              Editprofilerequest(
                                  name: nameController.text,
                                  address: Addresscontroller.text,
                                  phone: Phonecontroller.text));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
