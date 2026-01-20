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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.emailcontroller});
  final TextEditingController emailcontroller;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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

  @override
  void dispose() {
    otp.dispose();
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
                    style: appTextStyle(size: 40.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Enter the verification code we just sent on your email address.",
                    style: appTextStyle(
                      color: appcolors.dark_gray,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Pinput(
                    controller: otp,
                    defaultPinTheme: defaultPinTheme,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  buttom(
                      text: "Verify",
                      onPressed: () {
                        context.read<AuthCubit>().otp(AuthParams(
                              verify_code: int.parse(otp.text),
                            ));
                      }),
                  SizedBox(
                    height: 350.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t received code?",
                        style: appTextStyle(size: 16.sp, color: appcolors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<AuthCubit>()
                              .resend(AuthParams(email: widget.emailcontroller.text));
                        },
                        child: Text(
                          "Resend",
                          style: appTextStyle(size: 15.sp, color: appcolors.prime),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
