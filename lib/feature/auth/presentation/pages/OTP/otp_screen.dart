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
import 'package:bookia1/feature/auth/presentation/pages/creatnewpass/creat_new_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';


class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.emailcontroller});
  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 8),
    width: 70,
    height: 60,
    textStyle: TextStyle(
        fontSize: 20, color: appcolors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: appcolors.prime, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  TextEditingController otp = TextEditingController();

  final TextEditingController emailcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back_arrow(context),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pop(context);
            log("succes");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CreatNewPass(
                          otpcontroller: otp,
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
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: appTextStyle(size: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: appTextStyle(
                    color: appcolors.dark_gray,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Pinput(
                  controller: otp,
                  defaultPinTheme: defaultPinTheme,
                ),
                SizedBox(
                  height: 40,
                ),
                buttom(
                    text: "Verify",
                    onPressed: () {
                      context.read<AuthCubit>().otp(AuthParams(
                            verify_code: int.parse(otp.text),
                          ));
                    }),
                SizedBox(
                  height: 400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t received code?",
                      style: appTextStyle(size: 16, color: appcolors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<AuthCubit>()
                            .resend(AuthParams(email: emailcontroller.text));
                      },
                      child: Text(
                        "Resend",
                        style: appTextStyle(size: 15, color: appcolors.prime),
                      ),
                    )
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
