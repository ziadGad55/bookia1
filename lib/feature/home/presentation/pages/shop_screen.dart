import 'package:bookia1/feature/home/presentation/cubit/homecubit_cubit.dart';
import 'package:bookia1/feature/home/presentation/widget/homeslider.dart';
import 'package:bookia1/feature/home/presentation/widget/item_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBestSeller()
        ..getslider(),
      child: Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset("assets/images/logo 2.svg", height: 38),
            centerTitle: false,
            actions: [
              IconButton(
                icon: SvgPicture.asset("assets/icons/notification.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/search-normal.svg"),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeslider(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: item_book(),
                )
              ],
            ),
          )),
    );
  }
}
