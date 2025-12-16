import 'package:bookia1/core/color/colors.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static bool Ishide = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  Text("Welcome back! Glad to see you, Again!",
                      style: appTextStyle(
                        size: 38,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: Ishide,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
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
                                  width: 20,
                                  height: 20,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassScreen()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: appTextStyle(
                                size: 15, color: appcolors.dark_gray),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  buttom(
                    text: "Login",
                    onPressed: () {
                      context.read<AuthCubit>().login(AuthParams(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Divider(
                        color: appcolors.gray,
                      ),
                      Center(
                        child: Container(
                          width: 90,
                          height: 19,
                          color: Colors.white,
                          child: Text(
                            "Or Login with",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                        width: 15,
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
                          child: SvgPicture.asset("assets/icons/google_ic.svg"),
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
                    height: 155,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              fontSize: 15,
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
                                    builder: (context) => RegisterScreem()));
                          },
                          child: Text("Register Now"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
