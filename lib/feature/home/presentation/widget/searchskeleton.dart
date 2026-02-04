import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class searchskeleton extends StatelessWidget {
  const searchskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "All Books",
            style: appTextStyle(size: 30.sp),
          ),
          SizedBox(height: 15.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 10.h,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: appcolors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.r),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // صورة
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius:
                                BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
    
                      SizedBox(height: 5.h),
    
                      // اسم الكتاب
                      Container(
                        height: 20.h,
                        width: 120.w,
                        color: Colors.grey.shade300,
                      ),
    
                      SizedBox(height: 25.h),
    
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          // السعر
                          Container(
                            height: 20.h,
                            width: 60.w,
                            color: Colors.grey.shade300,
                          ),
    
                          // زر Buy
                          Container(
                            height: 30.h,
                            width: 77.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius:
                                  BorderRadius.circular(
                                      8.r),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
              
            },
          ),
        ]);
  }
}
