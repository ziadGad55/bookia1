import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/feature/profile/presentation/cubit/cubit/profilecubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myorder extends StatelessWidget {
  Myorder({super.key});

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..Myorder(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: back_arrow(context),
          actions: [
            Text(
              'My Orders',
              style: appTextStyle(size: 25.sp),
            ),
            SizedBox(
              width: 125.w,
            ),
          ],
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              var orders =
                  context.read<ProfileCubit>().myorderrespons?.data?.orders ??
                      [];
              return orders.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(22),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 170.h,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Order No:${orders[index].orderCode}',
                                      style: appTextStyle(size: 30.sp),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${orders[index].orderDate}',
                                      style: appTextStyle(
                                          size: 20.sp, color: appcolors.dark_gray),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Total Amount:',
                                      style: appTextStyle(
                                          size: 25, color: appcolors.dark_gray),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '\$${orders[index].total}',
                                      style: appTextStyle(
                                          size: 30.sp,
                                          color: appcolors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: orders.length,
                      ),
                    )
                  : Center(
                      child: Text(
                      'No History Yet',
                      style: appTextStyle(size: 40.sp, color: appcolors.prime),
                    ));
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: appcolors.prime,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
