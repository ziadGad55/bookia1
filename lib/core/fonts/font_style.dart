import 'package:bookia1/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle appTextStyle({Color? color, double? size, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'DMserifDisplay',
    fontSize: size ?? 18.sp,
    color: color ?? appcolors.black,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}
