import 'dart:developer';

import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/cart/data/model/cartrespons/cartrespons.dart';
import 'package:bookia1/feature/cart/data/model/checkout/checkout.dart';

class cartRepo {
  static Future<Cartrespons?> getcart() async {
    try {
      var response = await dioprovider.get(endpoint: 'cart', headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (response.statusCode == 200) {
        return Cartrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Cartrespons?> removefromcart(int cartitemid) async {
    try {
      var response = await dioprovider.post(
          data: {"cart_item_id": cartitemid},
          endpoint: 'remove-from-cart',
          headers: {
            'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
          });
      if (response.statusCode == 200) {
        return Cartrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Cartrespons?> updatecart(int cartitemid, int quantity) async {
    try {
      var response = await dioprovider.post(
          data: {"cart_item_id": cartitemid, "quantity": quantity},
          endpoint: 'update-cart',
          headers: {
            'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
          });
      if (response.statusCode == 201) {
        return Cartrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }



  static Future<bool?> checkout() async {
    try {
      var response = await dioprovider.get(endpoint: 'checkout', headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
