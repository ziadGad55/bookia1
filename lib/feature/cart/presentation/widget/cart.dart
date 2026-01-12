import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/feature/cart/data/model/cartrespons/cart_item.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class cartbook extends StatelessWidget {
  const cartbook({
    super.key,
    required this.book,
    this.onremove, required this.onadd, required this.onminus,
  });
  final CartItem book;
  final Function()? onremove;
  final Function() onadd;
  final Function() onminus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              imageUrl: book.itemProductImage ?? '',
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            )),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      book.itemProductName ?? '',
                      style: appTextStyle(size: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: onremove,
                    icon: SvgPicture.asset(
                      'assets/icons/Shape.svg',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' ₹${book.itemProductPriceAfterDiscount}',
                style: appTextStyle(size: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FloatingActionButton.small(
                    onPressed: onadd,
                    child: Icon(Icons.add),
                    elevation: 0,
                    backgroundColor: appcolors.prime,
                    foregroundColor: appcolors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    book.itemQuantity.toString(),
                    style: appTextStyle(size: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton.small(
                    onPressed: onminus,
                    child: Icon(Icons.remove),
                    elevation: 0,
                    backgroundColor: appcolors.prime,
                    foregroundColor: appcolors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
