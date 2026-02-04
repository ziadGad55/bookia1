import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/constant/profile.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/auth/presentation/pages/welcome/welcome_screen.dart';
import 'package:bookia1/feature/profile/presentation/cubit/cubit/profilecubit_cubit.dart';
import 'package:bookia1/feature/profile/presentation/page/Edit%20password/edit_password.dart';
import 'package:bookia1/feature/profile/presentation/page/Edit%20profile/Edit_profile.dart';
import 'package:bookia1/feature/profile/presentation/page/myOrder/myOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redacted/redacted.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..Myprofile(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ExitLoaded) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
              (route) => false,
            );
          } else if (state is ExitError) {
            Navigator.pop(context);
            errortoast(state.message, context);
          } else if (state is ExitLoading) {
            loading(context);
          }
        },
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: appTextStyle(size: 35.sp),
            ),
            centerTitle: true,
            actions: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return IconButton(
                    icon: SvgPicture.asset('assets/icons/Frame 15.svg',
                        height: 25.h),
                    onPressed: () {
                      context.read<ProfileCubit>().logout();
                    },
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                  var usersdata = context.read<ProfileCubit>().userdata?.data;
                  if (state is ProfileLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${usersdata?.name}',
                          style: appTextStyle(
                              size: 30.sp, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '${usersdata?.email}',
                          style: appTextStyle(
                              size: 20.sp, color: appcolors.dark_gray),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الاسم
                        Container(
                          height: 30.h,
                          width: 180.w,
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: 5.h),

                        // الإيميل
                        Container(
                          height: 20.h,
                          width: 220.w,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ).redacted(context: context, redact: true);
                  }
                }),
                SizedBox(height: 40.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: profileOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Myorder()));
                            break;
                          case 1:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                            break;
                          case 2:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPassword()));
                            break;
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff8A959E).withOpacity(0.2),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text('${profileOptions[index]}',
                                style: appTextStyle(
                                  size: 20.sp,
                                )),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
