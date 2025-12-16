import 'dart:developer';

import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/feature/auth/presentation/pages/welcome/welcome_screen.dart';
import 'package:bookia1/feature/main/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    String? token = appdata.getdata(appdata.usertoken);
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      if (token != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        log(token);
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo 2.svg",
            ),
            Text(
              "Order Your Book Now!",
              style: appTextStyle(size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
