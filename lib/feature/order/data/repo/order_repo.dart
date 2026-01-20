import 'dart:developer';

import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/order/data/model/OrderRequest/Order_params.dart';
import 'package:bookia1/feature/order/data/model/OrderRespons/order_respons/order_respons.dart';
import 'package:bookia1/feature/order/data/model/governorates/governorates.dart';

class OrderRepo {
  static Future<Governorates?> getgovernorates() async {
    try {
      var response = await dioprovider.get(endpoint: 'governorates');
      if (response.statusCode == 200) {
        return Governorates.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OrderRespons?> Submit_Order(OrderParams params) async {
    try {
      var response = await dioprovider.post(
          endpoint: 'place-order',
          data: params.toJson(),
          headers: {
            'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
          });
      if (response.statusCode == 201) {
        return OrderRespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
