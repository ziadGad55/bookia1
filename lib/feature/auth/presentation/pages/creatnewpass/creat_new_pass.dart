import 'dart:developer';

import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth.cubit.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth_state.dart';
import 'package:bookia1/feature/auth/presentation/pages/password_changed/pass_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatNewPass extends StatefulWidget {
  CreatNewPass({super.key, required this.otpcontroller});

  @override
  final TextEditingController otpcontroller;

  @override
  State<CreatNewPass> createState() => _CreatNewPassState();
}

class _CreatNewPassState extends State<CreatNewPass> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  TextEditingController newpass = TextEditingController();

  TextEditingController confirmpass = TextEditingController();
  @override
  void dispose() {
    newpass.dispose();
    confirmpass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: back_arrow(context),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pop(context);
              log("succes");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PassChangedScreen()));
            } else if (state is AuthError) {
              Navigator.pop(context);
              errortoast(state.error, context);
            } else if (state is AuthLoading) {
              loading(context);
            }
          },
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create new password",
                    style: appTextStyle(size: 35.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Your new password must be unique from those previously used.",
                    style: appTextStyle(size: 16.sp, color: appcolors.dark_gray),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: newpass,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      hintStyle:
                          appTextStyle(size: 15.sp, color: appcolors.dark_gray),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password required';
                      } else if (value.length < 9) {
                        return 'Password must be more than 9 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: confirmpass,
                    decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      hintStyle:
                          appTextStyle(size: 15.sp, color: appcolors.dark_gray),
                    ),
                    validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password required';
                            } else if (value.length < 9) {
                              return 'Password must be more than 9 characters';
                            } else {
                              return null;
                            }
                          },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  buttom(
                      text: "Reset Password",
                      onPressed: () {if (formkey.currentState!.validate()) {
                        context.read<AuthCubit>().newpass(AuthParams(
                            verify_code: int.parse(widget.otpcontroller.text),
                            password: newpass.text,
                            passwordConfirmation: confirmpass.text));
                      }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
