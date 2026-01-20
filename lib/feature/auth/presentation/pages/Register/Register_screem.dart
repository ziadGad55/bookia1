import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/constant/emailvalidation.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreem extends StatefulWidget {
  RegisterScreem({super.key});

  @override
  State<RegisterScreem> createState() => _RegisterScreemState();
}

class _RegisterScreemState extends State<RegisterScreem> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirm_password_Controller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirm_password_Controller.dispose();
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
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text(
                      "Hello! Register to get started",
                      style: appTextStyle(size: 33.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle:
                            appTextStyle(size: 15.sp, color: appcolors.dark_gray),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            appTextStyle(size: 15.sp, color: appcolors.dark_gray),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email required';
                        } else if (!emailValidate(value)) {
                          return 'Enter your Email correct';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
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
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: confirm_password_Controller,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
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
                      height: 30.h,
                    ),
                    buttom(
                        text: "Register",
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthCubit>().register(AuthParams(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirmation:
                                    confirm_password_Controller.text));
                          }
                        }),
                    SizedBox(
                      height: 150.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: appTextStyle(size: 15.sp),
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
                              style:
                                  appTextStyle(color: appcolors.prime, size: 15.sp),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
