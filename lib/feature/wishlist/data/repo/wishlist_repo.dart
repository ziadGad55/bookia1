import 'dart:developer';

import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/wishlist/data/model/wishlistrespons/wishlistrespons.dart';

class WishlistRepo {
  static Future<Wishlistrespons?> getWishlist() async {
    try {
      var response = await dioprovider.get(endpoint: 'wishlist', headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (response.statusCode == 200) {
        return Wishlistrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Wishlistrespons?> removefromwishlist(int productid) async {
    try {
      var response = await dioprovider.post(
          data: {"product_id": productid},
          endpoint: 'remove-from-wishlist',
          headers: {
            'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
          });
      if (response.statusCode == 200) {
        return Wishlistrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool?> addtocart(int productid) async {
    try {
      var response = await dioprovider.post(endpoint: 'add-to-cart', data: {
        "product_id": productid,
      }, headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
