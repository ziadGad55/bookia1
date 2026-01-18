import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/order/presentation/page/place_order.dart';
import 'package:flutter/material.dart';

class bottom_of_widget extends StatelessWidget {
  const bottom_of_widget({
    super.key,
    required this.widget,
    required this.onPressed,
  });

  final PlaceOrder widget;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ',
              style: appTextStyle(size: 25, color: appcolors.dark_gray),
            ),
            Text(
              '\$ ${widget.total}',
              style: appTextStyle(size: 25),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        buttom(
          text: "Submit Order",
          onPressed: onPressed,
        ),
      ],
    );
  }
}
