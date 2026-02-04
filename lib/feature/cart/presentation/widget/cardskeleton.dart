import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class cardskeleton extends StatelessWidget {
  const cardskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey,
                height: 30,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  // صورة المنتج
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
                        // الاسم + أيقونة الحذف
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
                          width: 100.w,
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: 10.h),

                        // أزرار + / - والكمية
                        Row(
                          children: [
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 20.h,
                              width: 30.w,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Column(
        //   children: [
        //     Divider(
        //       color: Colors.grey,
        //       height: 30.h,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(20.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Total: ',
        //             style:
        //                 appTextStyle(size: 25.sp, color: appcolors.dark_gray),
        //           ),
        //           Text(
        //             '\$${context.read<CartCubit>().cartrespons?.data?.total}',
        //             style: appTextStyle(size: 25.sp),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Padding(
        //         padding: EdgeInsets.all(20),
        //         child: Container(
        //           width: double.infinity,
        //           height: 55.h,
        //           decoration: BoxDecoration(
        //               color: Colors.grey.shade300,
        //               borderRadius: BorderRadius.circular(10)),
        //         ))
        //   ],
        // ),
      ],
    );
  }
}
