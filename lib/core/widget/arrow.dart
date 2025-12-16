import 'package:bookia1/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar back_arrow(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appcolors.gray, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/back_arrow.svg",
            ),
          ],
        ),
      ),
    ),
  );
}
