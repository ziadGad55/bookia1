import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/home/data/model/bestseller_respons/product.dart';
import 'package:bookia1/feature/home/presentation/cubit/homecubit_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Book extends StatelessWidget {
  const Book({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is addWishlistcartLoading) {
            loading(context);
          } else if (state is addWishlistcartLoaded) {
            Navigator.pop(context);
            errortoast(state.message, context, ErrorType.success);
          } else if (state is addWishlistcartError) {
            Navigator.pop(context);
            errortoast("error", context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: back_arrow(context),
            leadingWidth: 80,
            actions: [
              IconButton(
                onPressed: () {
                  context.read<HomeCubit>().addtowishlist(book.id ?? 0);
                },
                icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Hero(
                            tag: book.id ?? '',
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CachedNetworkImage(
                                  imageUrl: book.image ?? '',
                                  height: 270,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            book.name ?? '',
                            style: appTextStyle(size: 25),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            book.category ?? '',
                            style: appTextStyle(color: appcolors.prime),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            book.description ?? '',
                            textAlign: TextAlign.justify,
                            style: appTextStyle(size: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ ${book.priceAfterDiscount}",
                        style: appTextStyle(size: 25),
                      ),
                      buttom(
                        text: "Add To Cart",
                        onPressed: () {
                          context.read<HomeCubit>().addtocart(book.id ?? 0);
                        },
                        color: appcolors.black,
                        width: 200,
                        height: 55,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
