import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/auth/data/models/response/auth_response/data.dart';

import 'package:bookia1/feature/cart/presentation/cubit/cubit/cartcubit_cubit.dart';
import 'package:bookia1/feature/cart/presentation/widget/cart.dart';
import 'package:bookia1/feature/order/presentation/page/place_order.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getcart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'cart',
            style: appTextStyle(size: 25),
          ),
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CheckoutLoaded) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceOrder(
                    total:state.total,
                        
                  ),
                ),
              );
            } else if (state is CartError) {
              Navigator.pop(context);
              errortoast(state.massage, context);
            } else if (state is CheckoutLoading) {
              loading(context);
            }
          },
          builder: (context, state) {
            if (state is CartLoaded ||
                state is CartError ||
                state is CheckoutLoaded) {
              var books =
                  context.read<CartCubit>().cartrespons?.data?.cartItems ?? [];
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
                            height: 20,
                          ),
                          Text(
                            'No Items in cart',
                            style:
                                appTextStyle(size: 25, color: appcolors.prime),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(20),
                            itemCount: books.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: Colors.grey,
                                height: 30,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return cartbook(
                                book: books[index],
                                onremove: () {
                                  context
                                      .read<CartCubit>()
                                      .removefromcart(books[index].itemId ?? 0);
                                },
                                onadd: () {
                                  if ((books[index].itemProductStock ?? 0) >
                                      (books[index].itemQuantity ?? 0)) {
                                    context.read<CartCubit>().updatecart(
                                        books[index].itemId ?? 0,
                                        (books[index].itemQuantity ?? 0) + 1);
                                  } else {
                                    errortoast("Cannot Add More", context);
                                  }
                                },
                                onminus: () {
                                  if ((books[index].itemQuantity ?? 0) > 1) {
                                    context.read<CartCubit>().updatecart(
                                        books[index].itemId ?? 0,
                                        (books[index].itemQuantity ?? 0) - 1);
                                  } else {
                                    errortoast("Cannot Delete More", context);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Divider(
                              color: Colors.grey,
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total: ',
                                    style: appTextStyle(
                                        size: 25, color: appcolors.dark_gray),
                                  ),
                                  Text(
                                    '\$${context.read<CartCubit>().cartrespons?.data?.total}',
                                    style: appTextStyle(size: 25),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: buttom(
                                text: "Checkout",
                                onPressed: () async {
                                  await context.read<CartCubit>().Checkout();
                                },
                              ),
                            )
                          ],
                        ),
                      ],
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
