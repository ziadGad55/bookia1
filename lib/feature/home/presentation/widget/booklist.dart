import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/feature/home/data/model/bestseller_respons/product.dart';
import 'package:bookia1/feature/home/presentation/pages/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class booklist extends StatelessWidget {
  booklist({
    super.key,
    required this.book,
  });
  final Product book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Book(
                    book: book,
                  ))),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF5EFE1),
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.all(6.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Hero(
                  tag: book.id ?? '',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: book.image ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorWidget: (context, url, error) {
                        return Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                )),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  book.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(size: 20.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "₹ ${book.priceAfterDiscount}",
                        style: appTextStyle(size: 18.sp),
                      ),
                    ),
                    Expanded(
                      child: buttom(
                        text: "Buy",
                        onPressed: () {},
                        color: appcolors.black,
                        height: 25.h,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
