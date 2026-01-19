import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/profile/data/model/EditPassRequest/EditPassRequest.dart';
import 'package:bookia1/feature/profile/presentation/cubit/cubit/profilecubit_cubit.dart';
import 'package:bookia1/feature/profile/presentation/page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPassword extends StatefulWidget {
  EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditPassword> {
  final TextEditingController currentpassController = TextEditingController();

  final TextEditingController newpasscontroller = TextEditingController();

  final TextEditingController confirmpasscontroller = TextEditingController();

  @override
  void dispose() {
    currentpassController.dispose();
    newpasscontroller.dispose();
    confirmpasscontroller.dispose();
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
                  'New Password',
                  style: appTextStyle(size: 25),
                ),
                SizedBox(
                  width: 125,
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
                    controller: currentpassController,
                    decoration: InputDecoration(
                      hintText: " Current Password",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: newpasscontroller,
                    decoration: InputDecoration(
                      hintText: "New password",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmpasscontroller,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return buttom(
                        text: "Update Password",
                        onPressed: () {
                          context.read<ProfileCubit>().EditPassword(EditPass(
                              currentassword: currentpassController.text,
                              newpassword: newpasscontroller.text,
                              newpasswordconfirmation:
                                  confirmpasscontroller.text));
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
