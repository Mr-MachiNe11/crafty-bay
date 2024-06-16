import 'dart:convert';

import 'package:crafty_bay/app.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/presentation/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      final Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: true);
      } else if (response.statusCode == 401) {
        _gotoSignInScreen();
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: false);
      } else {
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: true);
      }
    } catch (e) {
      return NetworkResponse(
          responseCode: -1, isSuccess: true, errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      final Response response = await post(Uri.parse(url), body: body,headers: {
        'accept': 'application/json'
      },);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: true);
      } else if (response.statusCode == 401) {
        _gotoSignInScreen();
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: false);
      } else {
        return NetworkResponse(
            responseCode: response.statusCode, isSuccess: true);
      }
    } catch (e) {
      return NetworkResponse(
          responseCode: -1, isSuccess: true, errorMessage: e.toString());
    }
  }

  static void _gotoSignInScreen() {
    /*Navigator.push(
      CraftyBay.navigatorKey.currentState!.context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );*/

    getx.Get.to(() => const EmailVerificationScreen());
  }
}
