import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wishlistskeleton extends StatelessWidget {
  const wishlistskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
          height: 30.h,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            // صورة وهمية
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                height: 120.h,
                width: 100.w,
                color: Colors.grey.shade300,
              ),
            ),
    
            SizedBox(width: 20.w),
    
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم الكتاب + أيقونة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 20.h,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        height: 24.h,
                        width: 24.w,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
    
                  SizedBox(height: 10.h),
    
                  // السعر
                  Container(
                    height: 18.h,
                    width: 80.w,
                    color: Colors.grey.shade300,
                  ),
    
                  SizedBox(height: 20.h),
    
                  // زر Add to Cart
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 40.h,
                      width: 155.w,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
