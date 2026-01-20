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
import 'package:bookia1/feature/auth/presentation/pages/Register/Register_screem.dart';
import 'package:bookia1/feature/auth/presentation/pages/forgot_pass/forgot_pass_screen.dart';
import 'package:bookia1/feature/main/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static bool Ishide = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      Text("Welcome back! Glad to see you, Again!",
                          style: appTextStyle(
                            size: 34.sp,
                          )),
                      SizedBox(
                        height: 35.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          hintStyle: appTextStyle(
                              size: 15.sp, color: appcolors.dark_gray),
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
                        height: 20.h,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: Ishide,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: appTextStyle(
                              size: 15.sp, color: appcolors.dark_gray),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: 25,
                            minHeight: 25,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Ishide = !Ishide;
                                });
                              },
                              child: Ishide
                                  ? Icon(
                                      Icons.visibility_off,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/fluent_eye-20-filled.svg",
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                            ),
                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassScreen()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: appTextStyle(
                                    size: 15.sp, color: appcolors.dark_gray),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      buttom(
                        text: "Login",
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthCubit>().login(AuthParams(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Stack(
                        children: [
                          Divider(
                            color: appcolors.gray,
                          ),
                          Center(
                            child: Container(
                              width: 90.w,
                              height: 19.h,
                              color: Colors.white,
                              child: Text(
                                "Or Login with",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: appcolors.gray,
                                  )),
                              child: SvgPicture.asset(
                                "assets/icons/facebook_ic.svg",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appcolors.white,
                                  border: Border.all(
                                    color: appcolors.gray,
                                  )),
                              child: SvgPicture.asset(
                                  "assets/icons/google_ic.svg"),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: appcolors.gray,
                                  )),
                              child: Icon(
                                Icons.apple,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 11.h,
                              ),
                              Text(
                                "Don’t have an account? ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreem()));
                              },
                              child: Text(
                                "Register Now",
                                style: appTextStyle(
                                    size: 15.sp, color: appcolors.prime),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
