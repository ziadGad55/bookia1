import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/constant/profile.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';

import 'package:bookia1/feature/auth/presentation/pages/welcome/welcome_screen.dart';
import 'package:bookia1/feature/profile/presentation/cubit/cubit/profilecubit_cubit.dart';
import 'package:bookia1/feature/profile/presentation/page/myOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoading) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
              (route) => false,
            );
          } else if (state is ProfileError) {
            Navigator.pop(context);
            errortoast(state.message, context);
          } else if (state is ProfileLoading) {
            loading(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Profile',
                  style: appTextStyle(size: 35),
                ),
                centerTitle: true,
                actions: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return IconButton(
                        icon: SvgPicture.asset('assets/icons/Frame 15.svg',
                            height: 25),
                        onPressed: () {
                          context.read<ProfileCubit>().logout();
                        },
                      );
                    },
                  ),
                ],
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${appdata.getdata(appdata.name)}',
                      style:
                          appTextStyle(size: 30, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${appdata.getdata(appdata.email)}',
                      style: appTextStyle(size: 20, color: appcolors.dark_gray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 40),
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
                                // Navigate to Edit Profile screen
                                break;
                              case 2:
                                // Navigate to Reset Password screen
                                break;
                              case 3:
                                // Navigate to FAQ screen
                                break;
                              case 4:
                                // Navigate to Contact Us screen
                                break;
                              case 5:
                                // Navigate to Privacy & Terms screen
                                break;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
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
                                      size: 20,
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
                          height: 20,
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
