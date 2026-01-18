import 'package:shared_preferences/shared_preferences.dart';

class appdata {
  static late SharedPreferences cash;

  static String usertoken = 'token';
  static String myorderid = 'myorderid';
  static String name = 'name';
  static String email = 'email';


  static init() async {
    cash = await SharedPreferences.getInstance();
  }

  static cashdata(String key, dynamic value) async {
    if (value is int) {
      await cash.setInt(key, value);
    } else if (value is String) {
      await cash.setString(key, value);
    } else if (value is bool) {
      await cash.setBool(key, value);
    } else if (value is double) {
      await cash.setDouble(key, value);
    } else {
      await cash.setStringList(key, value);
    }
  }

  static getdata(String key) {
    return cash.get(key);
  }

  static cleardata(String key) async {
    await cash.remove(key);
  }
}
