import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/auth/presentation/pages/Login/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PassChangedScreen extends StatelessWidget {
  const PassChangedScreen({super.key});

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
              height: 35,
            ),
            Text("Password Changed!", style: appTextStyle(size: 30)),
            Text("Your password has been changed successfully.",
                style: appTextStyle(size: 16, color: appcolors.dark_gray)),
            SizedBox(
              height: 40,
            ),
            buttom(
                text: "Back to Login",
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                })
          ],
        ),
      )),
    );
  }
}
