import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class boollistskeleton extends StatelessWidget {
  const boollistskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Seller",
          style: appTextStyle(
            size: 30.sp,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisExtent: 280,
              mainAxisSpacing: 10.h),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  color: appcolors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صورة وهمية
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
    
                    const SizedBox(height: 6),
    
                    // اسم الكتاب
                    Container(
                      height: 18,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),
    
                    const SizedBox(height: 25),
    
                    // السعر + زر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18,
                          width: 60,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 30,
                          width: 70,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ],
                ));
          },
        )
      ],
    );
  }
}
