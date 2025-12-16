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

class CreatNewPass extends StatelessWidget {
  CreatNewPass({super.key, required this.otpcontroller});

  @override
  final TextEditingController otpcontroller;
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create new password",
                style: appTextStyle(size: 35),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your new password must be unique from those previously used.",
                style: appTextStyle(size: 16, color: appcolors.dark_gray),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: newpass,
                decoration: InputDecoration(
                  hintText: "New Password",
                  hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: confirmpass,
                decoration: InputDecoration(
                  hintText: "Confirm your Password",
                  hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              buttom(
                  text: "Reset Password",
                  onPressed: () {
                    context.read<AuthCubit>().newpass(AuthParams(
                        verify_code: int.parse(otpcontroller.text),
                        password: newpass.text,
                        passwordConfirmation: confirmpass.text));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
