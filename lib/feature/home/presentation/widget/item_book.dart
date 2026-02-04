import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/feature/home/presentation/cubit/homecubit_cubit.dart';
import 'package:bookia1/feature/home/presentation/widget/booklist.dart';
import 'package:bookia1/feature/home/presentation/widget/boollistskeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class item_book extends StatelessWidget {
  const item_book({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is BestsellerError ||
          current is BestsellerLoaded ||
          current is BestsellerLoading,
      builder: (context, state) {
        if (state is BestsellerLoaded) {
          var books =
              context.read<HomeCubit>().BestSellerRespons?.data?.products ?? [];
          return Column(
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
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return booklist(
                    book: books[index],
                  );
                },
              )
            ],
          );
        } else {
          return boollistskeleton().redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
            ),
          );
        }
      },
    );
  }
}


