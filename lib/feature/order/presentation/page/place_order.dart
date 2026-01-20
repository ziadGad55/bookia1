import 'package:bookia1/core/color/colors.dart';
import 'package:bookia1/core/fonts/font_style.dart';
import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/widget/arrow.dart';
import 'package:bookia1/core/widget/error.dart';
import 'package:bookia1/core/widget/loading.dart';
import 'package:bookia1/feature/order/data/model/OrderRequest/Order_params.dart';
import 'package:bookia1/feature/order/presentation/cubit/cubit/ordercubit_cubit.dart';
import 'package:bookia1/feature/order/presentation/page/success_screen.dart';
import 'package:bookia1/feature/order/presentation/widget/bottom_of_widget.dart';
import 'package:bookia1/feature/order/presentation/widget/center_of_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({
    super.key,
    required this.total,
  });

  @override
  final String total;
  State<PlaceOrder> createState() => _PlaceOrderState();
}

@override
class _PlaceOrderState extends State<PlaceOrder> {
  @override
  int? govid;
  String thisAddress = 'Cairo';

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController Addresscontroller = TextEditingController();

  TextEditingController Phonecontroller = TextEditingController();

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    Addresscontroller.dispose();
    Phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: back_arrow(context),
        body: BlocProvider(
          create: (context) => OrdercubitCubit()..getgovernorates(),
          child: BlocListener<OrdercubitCubit, OrdercubitState>(
            listener: (context, state) {
              if (state is OrdersubmitLoaded) {
                appdata.cashdata(appdata.myorderid,
                    context.read<OrdercubitCubit>().orderRespons?.data?.id);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessScreen()),
                  (route) => false,
                );
              } else if (state is OrdersubmitError) {
                Navigator.pop(context);
                errortoast(state.error, context);
              } else if (state is Ordersubmitloading) {
                loading(context);
              }
            },
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      center_of_widget(
                        nameController: nameController,
                        emailController: emailController,
                        Addresscontroller: Addresscontroller,
                        Phonecontroller: Phonecontroller,
                        formkey: formkey,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      BlocBuilder<OrdercubitCubit, OrdercubitState>(
                        buildWhen: (previous, current) =>
                            current is OrderLoaded ||
                            current is OrderError ||
                            current is OrderLoading,
                        builder: (context, state) {
                          if (state is OrderLoaded) {
                            var gov = context
                                    .read<OrdercubitCubit>()
                                    .governorates
                                    ?.data ??
                                [];
                            return Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                width: double.infinity,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appcolors.gray,
                                ),
                                child: DropdownButton(
                                    icon: SvgPicture.asset(
                                        'assets/icons/Vector.svg'),
                                    isExpanded: true,
                                    value: thisAddress,
                                    items: gov
                                        .map((city) => DropdownMenuItem(
                                              value: city.governorateNameEn,
                                              child: Text(
                                                city.governorateNameEn ?? '',
                                                style: appTextStyle(
                                                    size: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w200,
                                                    color: appcolors.black),
                                              ),
                                            ))
                                        .toList(),
                                    hint: Text('Select your address',
                                        style: appTextStyle(
                                            color: appcolors.dark_gray)),
                                    onChanged: (value) {
                                      setState(() {
                                        govid = gov
                                            .firstWhere((element) =>
                                                element.governorateNameEn ==
                                                value)
                                            .id;
                                        thisAddress = value ?? 'cairo';
                                      });
                                    }));
                          } else {
                            return Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                width: double.infinity,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appcolors.gray,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircularProgressIndicator(
                                      color: appcolors.prime,
                                    ),
                                  ],
                                ));
                          }
                        },
                      ),
                      SizedBox(height: 150.h),
                      BlocBuilder<OrdercubitCubit, OrdercubitState>(
                        builder: (context, state) {
                          return bottom_of_widget(
                            widget: widget,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                context.read<OrdercubitCubit>().SubmitOrder(
                                    OrderParams(
                                        fullname: nameController.text,
                                        email: emailController.text,
                                        phone: Phonecontroller.text,
                                        address: Addresscontroller.text,
                                        governorateId: govid ?? 1));
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
