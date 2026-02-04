import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class sliderskeleton extends StatelessWidget {
  const sliderskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3, // عدد وهمي
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
            );
          },
          options: CarouselOptions(
            height: 130.h,
            viewportFraction: 0.9,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
    
        SizedBox(height: 14.h),
    
        // Indicator وهمي
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
