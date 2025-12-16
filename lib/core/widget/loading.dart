import 'package:bookia1/core/color/colors.dart';
import 'package:flutter/material.dart';

loading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
            child: CircularProgressIndicator(
              backgroundColor: appcolors.prime,
              color: appcolors.prime,
            ),
          ));
}
