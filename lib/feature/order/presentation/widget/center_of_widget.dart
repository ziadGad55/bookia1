import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/constant/emailvalidation.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class center_of_widget extends StatelessWidget {
  const center_of_widget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.Addresscontroller,
    required this.Phonecontroller,
    required this.formkey,
  });

  final GlobalKey formkey;
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
          style: appTextStyle(size: 33.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Don't worry! It occurs. Please enter the email address linked with your account.",
          style: appTextStyle(size: 15.sp, color: appcolors.dark_gray),
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Full Name",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Name required';
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
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
          height: 12.h,
        ),
        TextFormField(
          controller: Addresscontroller,
          decoration: InputDecoration(
            hintText: "Address",
            hintStyle: appTextStyle(size: 15, color: appcolors.dark_gray),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'address required';
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: Phonecontroller,
          decoration: InputDecoration(
            hintText: "Phone",
            hintStyle: appTextStyle(size: 15.sp, color: appcolors.dark_gray),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'address required';
            } else if( value.length!=11){
              return 'please Enter your number correct';
            }
            else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
