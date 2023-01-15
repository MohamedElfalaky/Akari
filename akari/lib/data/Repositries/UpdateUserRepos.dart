import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class UpdateUserRepo {
  Future<dynamic> updatePassword(
      {required String currentPass,
      required String newPass,
      required String token}) async {
    try {
      var response = await http
          .patch(Uri.parse('$baseURL/user/change/password'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "currentPassword": currentPass,
        "newPassword": newPass
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = Page2VillaModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        print(responsemap["errors"]["body"][0]["message"]);

        return null;
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('TimeoutException: ${e.toString()}');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: ${e.toString()}');
      }
    }
  }

  ///////
  ///
  ///
  ///
  Future<dynamic> updateAll(
      {required String name,
      required String phone,
      required String about,
      required String token}) async {
    try {
      var response =
          await http.patch(Uri.parse('$baseURL/user/update-data'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "name": name,
        "phone": phone,
        "about": about,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = Page2VillaModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        print(responsemap["errors"]["body"][0]["message"]);

        return null;
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('TimeoutException: ${e.toString()}');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: ${e.toString()}');
      }
    }
  }

  //////////////////////////////
  ///
  ///
  ///
  Future<dynamic> updateMail(
      {required String newEmail, required String token}) async {
    try {
      var response = await http
          .post(Uri.parse('$baseURL/user/send-otp-to-change-mail'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "newEmail": newEmail,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = Page2VillaModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        print(responsemap["errors"]["body"][0]["message"]);

        return null;
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('TimeoutException: ${e.toString()}');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: ${e.toString()}');
      }
    }
  }

  //////////////////////////////
  ///
  ///
  ///
  Future<dynamic> updateMailOTP(
      {required String otp, required String token}) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/user/verify-change-email'),
              headers: {
                "Authorization": "bearer $token",
                "content-type": "application/json",
              },
              body: jsonEncode({
                "otp": int.parse(otp),
              }));

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = Page2VillaModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        print(responsemap["errors"]["body"][0]["message"]);

        return null;
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('TimeoutException: ${e.toString()}');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: ${e.toString()}');
      }
    }
  }
}
