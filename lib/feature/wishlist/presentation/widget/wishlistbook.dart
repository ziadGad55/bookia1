import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/wishlist/data/model/wishlistrespons/datum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class wishlistbook extends StatelessWidget {
  const wishlistbook({
    super.key,
    required this.book,
    this.onremove,
    required this.onaddtocart,
  });

  final Datum book;
  final Function()? onremove;
  final Function() onaddtocart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              imageUrl: book.image ?? '',
              height: 120.h,
              width: 100.w,
              fit: BoxFit.cover,
            )),
        SizedBox(
          width: 20.w,
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
                      book.name ?? '',overflow: TextOverflow.ellipsis,
                      style: appTextStyle(size: 20.sp),
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
                height: 10.h,
              ),
              Text(
                ' ₹${book.price}',
                style: appTextStyle(size: 18.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buttom(
                    text: 'Add To Cart',
                    onPressed: onaddtocart,
                    height: 40.h,
                    width: 155.w,
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
