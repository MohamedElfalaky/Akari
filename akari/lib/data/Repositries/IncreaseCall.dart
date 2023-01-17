import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class IncreaseCallRepo {
  Future<dynamic> increaseCall({
    required String advertiserId,
    required String token,
  }) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/user/increase-calls'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "advertiserId": advertiserId,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // myApplication.showToast(
        //     text: "${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        // myApplication.showToast(
        //     text: responsemap["message"], color: Colors.red);

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
