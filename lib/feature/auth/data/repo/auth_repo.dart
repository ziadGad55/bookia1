import 'dart:developer';

import 'package:bookia1/core/services/dio.dart';
import 'package:bookia1/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia1/feature/auth/data/models/response/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var respons =
          await dioprovider.post(endpoint: 'register', data: params.tojson());
      if (respons.statusCode == 201) {
        return AuthResponse.fromJson(respons.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var respons =
          await dioprovider.post(endpoint: 'login', data: params.tojson());
      if (respons.statusCode == 200) {
        return AuthResponse.fromJson(respons.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgot_password(AuthParams params) async {
    {
      try {
        var respons = await dioprovider.post(
            endpoint: 'forget-password', data: params.tojson());
        if (respons.statusCode == 200) {
          return AuthResponse.fromJson(respons.data);
        } else {
          return null;
        }
      } on Exception catch (e) {
        log(e.toString());
        return null;
      }
    }
  }

  static Future<AuthResponse?> otp(AuthParams params) async {
    {
      try {
        var respons = await dioprovider.post(
            endpoint: 'check-forget-password', data: params.tojson());
        if (respons.statusCode == 200) {
          return AuthResponse.fromJson(respons.data);
        } else {
          return null;
        }
      } on Exception catch (e) {
        log(e.toString());
        return null;
      }
    }
  }

  static Future<AuthResponse?> newpass(AuthParams params) async {
    {
      try {
        var respons = await dioprovider.post(
            endpoint: 'reset-password', data: params.tojson());
        if (respons.statusCode == 200) {
          return AuthResponse.fromJson(respons.data);
        } else {
          return null;
        }
      } on Exception catch (e) {
        log(e.toString());
        return null;
      }
    }
  }

  static Future<AuthResponse?> resend(AuthParams params) async {
    {
      try {
        var respons = await dioprovider.post(
            endpoint: 'forget-password', data: params.tojson());
        if (respons.statusCode == 200) {
          return AuthResponse.fromJson(respons.data);
        } else {
          return null;
        }
      } on Exception catch (e) {
        log(e.toString());
        return null;
      }
    }
  }
}
