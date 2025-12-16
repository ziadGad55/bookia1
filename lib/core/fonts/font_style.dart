import 'package:bookia1/core/color/colors.dart';
import 'package:flutter/material.dart';

TextStyle appTextStyle({Color? color, double? size}) {
  return TextStyle(
    fontFamily: 'DMserifDisplay',
    fontSize: size ?? 18,
    color: color ?? appcolors.black,
    fontWeight: FontWeight.w500,
  );
}
