import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ErrorType { error, success }

errortoast(String massage, BuildContext context,
    [ErrorType type = ErrorType.error]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: type == ErrorType.success ? appcolors.prime : Colors.red,
      content: Text(
        massage,
        style: appTextStyle(size: 16.sp, color: appcolors.white),
      )));
}
