import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/main/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/Successmark.svg"),
            SizedBox(
              height: 35.h,
            ),
            Text("SUCCESS!", style: appTextStyle(size: 30.sp)),
            Text(
                "Your order will be delivered soon.\nThank you for choosing our app!",
                style: appTextStyle(size: 16.sp, color: appcolors.dark_gray)),
            SizedBox(
              height: 40.h,
            ),
            buttom(
                text: "Back to Home",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (context) => false);
                })
          ],
        ),
      )),
    );
  }
}
