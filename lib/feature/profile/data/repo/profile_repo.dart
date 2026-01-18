import 'dart:developer';

import 'package:bookia1/core/services/cashing.dart';
import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/profile/data/model/myorderrespons/myorderrespons.dart';

class ProfileRepo {

  static Future<bool?> logout() async {
    try {
      var response = await dioprovider.post(endpoint: 'logout', headers: {
        'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
      });
      if (response.statusCode == 200) {
        appdata.cleardata(appdata.usertoken);
        log(appdata.getdata(appdata.usertoken).toString());
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Myorderrespons?> Myorder() async {
    try {
      var response = await dioprovider.get(
          endpoint: 'order-history',
          headers: {
            'Authorization': 'Bearer ${appdata.getdata(appdata.usertoken)}'
          });

      if (response.statusCode == 200) {

        return Myorderrespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
