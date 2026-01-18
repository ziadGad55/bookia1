import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';

class center_of_widget extends StatelessWidget {
  const center_of_widget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.Addresscontroller,
    required this.Phonecontroller,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController Addresscontroller;
  final TextEditingController Phonecontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Place Your Order",
          style: appTextStyle(size: 33),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Don't worry! It occurs. Please enter the email address linked with your account.",
          style: appTextStyle(size: 15, color: appcolors.dark_gray),
        ),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Full Name",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: Addresscontroller,
          decoration: InputDecoration(
            hintText: "Address",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: Phonecontroller,
          decoration: InputDecoration(
            hintText: "Phone",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
        ),
      ],
    );
  }
}
