import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';

class buttom extends StatelessWidget {
  const buttom({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.color,
    this.textColor,
    this.isborder,
    this.height,
  });

  final double? width;
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final bool? isborder;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? double.infinity,
        height: height ?? 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? appcolors.prime,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: isborder == true
                    ? BorderSide(color: appcolors.black, width: 1)
                    : BorderSide.none,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style:
                  appTextStyle(size: 18, color: textColor ?? appcolors.white),
            )));
  }
}
