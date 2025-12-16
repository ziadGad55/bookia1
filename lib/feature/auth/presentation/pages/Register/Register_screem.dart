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
import 'package:bookia1/feature/main/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreem extends StatelessWidget {
  RegisterScreem({super.key});

  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_password_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back_arrow(context),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false,
            );
          } else if (state is AuthError) {
            Navigator.pop(context);
            errortoast(state.error, context);
          } else if (state is AuthLoading) {
            loading(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Text(
                  "Hello! Register to get started",
                  style: appTextStyle(size: 33),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle:
                        appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle:
                        appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle:
                        appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: confirm_password_Controller,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    hintStyle:
                        appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                buttom(
                    text: "Register",
                    onPressed: () {
                      context.read<AuthCubit>().register(AuthParams(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirmation:
                              confirm_password_Controller.text));
                    }),
                SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: appTextStyle(size: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Logein Now",
                          style: appTextStyle(color: appcolors.prime, size: 15),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
