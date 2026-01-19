import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/feature/home/data/model/bestseller_respons/product.dart';
import 'package:bookia1/feature/home/presentation/cubit/homecubit_cubit.dart';
import 'package:bookia1/feature/home/presentation/widget/booklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Product> filterbooks = [];
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllProdact(),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              appBar: AppBar(
                title: back_arrow(context),
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                  padding: const EdgeInsets.all(22),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      var books = context
                              .read<HomeCubit>()
                              .AllProdact
                              ?.data
                              ?.products ??
                          [];
                      if (state is AllprodactLoaded) {
                        return Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: TextField(
                                      onTap: () => setState(() {
                                            searching = true;
                                          }),
                                      onChanged: (value) {
                                        setState(() {
                                          filterbooks = books
                                              .where((book) =>
                                                  book.name
                                                      ?.toLowerCase()
                                                      .contains(value
                                                          .toLowerCase()) ??
                                                  false)
                                              .toList();
                                        });
                                      },
                                      controller: searchController,
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          hintStyle: appTextStyle(
                                            size: 18,
                                            color: appcolors.dark_gray,
                                          ),
                                          prefixIcon: SvgPicture.asset(
                                              'assets/icons/search-normal.svg',
                                              fit: BoxFit.scaleDown),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "All Books",
                                      style: appTextStyle(
                                        size: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: PageScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisExtent: 280,
                                              mainAxisSpacing: 10),
                                      itemCount: searching
                                          ? filterbooks.length
                                          : books.length,
                                      itemBuilder: (context, index) {
                                        return booklist(
                                          book: searching
                                              ? filterbooks[index]
                                              : books[index],
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: appcolors.prime,
                        ));
                      }
                    },
                  )))),
    );
  }
}
