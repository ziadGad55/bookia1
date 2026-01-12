import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/buttom.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth.cubit.dart';
import 'package:bookia1/feature/auth/presentation/cubit/auth_state.dart';
import 'package:bookia1/feature/main/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  String thisAddress = 'cairo';

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController Addresscontroller = TextEditingController();

  TextEditingController Phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back_arrow(context),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false,
            );
          } else if (state is AuthError) {
            Navigator.pop(context);
            errortoast(state.error, context);
          } else if (state is AuthLoading) {
            loading(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Place Your Order",
                    style: appTextStyle(size: 33),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: appTextStyle(size: 15, color: appcolors.dark_gray),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: Addresscontroller,
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: Phonecontroller,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle:
                          appTextStyle(size: 15, color: appcolors.dark_gray),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appcolors.gray,
                      ),
                      child: DropdownButton(
                          icon: SvgPicture.asset('assets/icons/Vector.svg'),
                          isExpanded: true,
                          value: thisAddress,
                          items: ['cairo', 'giza', 'alex']
                              .map((city) => DropdownMenuItem(
                                    value: city,
                                    child: Text(city,style: appTextStyle(color: appcolors.dark_gray),),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              thisAddress = value??thisAddress[0];
                            });
                          })),
                  SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style:
                            appTextStyle(size: 25, color: appcolors.dark_gray),
                      ),
                      Text(
                        '\$',
                        style: appTextStyle(size: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buttom(
                    text: "Checkout",
                    onPressed: () {},
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
