import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/feature/home/presentation/cubit/homecubit_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeslider extends StatefulWidget {
  const homeslider({
    super.key,
  });

  @override
  State<homeslider> createState() => _homesliderState();
}

class _homesliderState extends State<homeslider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is sliderError ||
          current is sliderLoaded ||
          current is sliderLoading,
      builder: (context, state) {
        if (state is sliderLoaded) {
          var sliderdata =
              context.read<HomeCubit>().sliderRospons?.data?.sliders ?? [];
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: sliderdata.length,
                  itemBuilder: (BuildContext context, int itemindex,
                          int pageviewindex) =>
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: sliderdata[itemindex].image ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )),
                  options: CarouselOptions(
                    height: 130.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: 14.h,
              ),
              SmoothPageIndicator(
                  controller: PageController(initialPage: currentIndex),
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotWidth: 8.w,
                      dotHeight: 8.h,
                      expansionFactor: 7,
                      dotColor: Colors.grey,
                      activeDotColor: appcolors.prime,
                      spacing: 5.w),
                  onDotClicked: (index) {})
            ],
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: appcolors.prime,
          ));
        }
      },
    );
  }
}
