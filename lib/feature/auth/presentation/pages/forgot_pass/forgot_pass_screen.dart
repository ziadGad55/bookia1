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
import 'package:bookia1/feature/auth/presentation/pages/Login/Login_screen.dart';
import 'package:bookia1/feature/auth/presentation/pages/OTP/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: back_arrow(context),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pop(context);
            log("good");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OtpScreen(
                          emailcontroller: email,
                        )));
          } else if (state is AuthError) {
            Navigator.pop(context);

            errortoast(state.error, context);
          } else if (state is AuthLoading) {
            loading(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password?",
                  style: appTextStyle(size: 35),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: appTextStyle(color: appcolors.dark_gray, size: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle:
                        appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                buttom(
                  text: "Send Code",
                  onPressed: () {
                    context.read<AuthCubit>().forgot_password(AuthParams(
                          email: email.text,
                        ));
                  },
                ),
                SizedBox(
                  height: 400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember Password?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: appcolors.prime,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
