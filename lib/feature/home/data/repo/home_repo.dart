import 'dart:developer';

import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/home/data/model/bestseller_respons/bestseller_respons.dart';
import 'package:bookia1/feature/home/data/model/slider_rospons/slider_rospons.dart';

class Homerepo {
  static Future<BestsellerRespons?> getBestSeller() async {
    try {
      var respons = await dioprovider.get(endpoint: 'products-bestseller');
      if (respons.statusCode == 200) {
        return BestsellerRespons.fromJson(respons.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SliderRospons?> getslider() async {
    try {
      var respons = await dioprovider.get(endpoint: 'sliders');
      if (respons.statusCode == 200) {
        return SliderRospons.fromJson(respons.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool?> addtowishlist(int productid) async {
    try {
      var respons = await dioprovider.post(endpoint: 'add-to-wishlist', data: {
        "product_id": productid,
      }, headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (respons.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool?> addtocart(int productid) async {
    try {
      var respons = await dioprovider.post(endpoint: 'add-to-cart', data: {
        "product_id": productid,
      }, headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (respons.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<BestsellerRespons?> getAllProdact() async {
    try {
      var respons = await dioprovider.get(endpoint: 'products');
      if (respons.statusCode == 200) {
        return BestsellerRespons.fromJson(respons.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
