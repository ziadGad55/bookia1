import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/wishlist/presentation/cubit/wishlist_cubit_cubit.dart';
import 'package:bookia1/feature/wishlist/presentation/widget/wishlistbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wishlist',
            style: appTextStyle(size: 25),
          ),
        ),
        body: BlocConsumer<WishlistCubit, WishlistCubitState>(
          listener: (context, state) {
            if (state is cartCubitLoading) {
              loading(context);
            } else if (state is cartCubitSuccess) {
              Navigator.pop(context);
              errortoast("Added To Cart", context, ErrorType.success);
            } else if (state is cartCubitError) {
              Navigator.pop(context);
              errortoast("error", context);
            }
          },
          builder: (context, state) {
            if (state is WishlistCubitSuccess ||
                state is cartCubitSuccess ||
                state is cartCubitError ||
                state is cartCubitLoading) {
              var books =
                  context.read<WishlistCubit>().wishlistrespons?.data?.data ??
                      [];
              return books.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_sharp,
                            size: 120,
                            color: appcolors.prime,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'No Items in Wishlist',
                            style:
                                appTextStyle(size: 25.sp, color: appcolors.prime),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: books.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey,
                          height: 30.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return wishlistbook(
                          book: books[index],
                          onremove: () {
                            context
                                .read<WishlistCubit>()
                                .removeFromWishlist(books[index].id ?? 0);
                          },
                          onaddtocart: () {
                            context
                                .read<WishlistCubit>()
                                .addtocart(books[index].id ?? 0);
                          },
                        );
                      },
                    );
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
