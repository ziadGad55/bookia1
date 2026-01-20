import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/auth/presentation/pages/Login/Login_screen.dart';
import 'package:bookia1/feature/auth/presentation/pages/Register/Register_screem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/photo-1543497415-75c0a27177c0.jpeg"),
                fit: BoxFit.fill)),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              SvgPicture.asset(
                "assets/images/logo 2.svg",
              ),
              Text(
                "Order Your Book Now!",
                style: appTextStyle(size: 20),
              ),
              Spacer(
                flex: 5,
              ),
              buttom(
                text: "Login",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                width: double.infinity,
              ),
              SizedBox(
                height: 15.h,
              ),
              buttom(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreem()));
                },
                width: double.infinity,
                color: appcolors.white,
                textColor: appcolors.black,
                isborder: true,
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
