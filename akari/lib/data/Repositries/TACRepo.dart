import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/tac_model/tac_model.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class TACRepo {
  Future<TacModel?> TAC(dynamic token) async {
    try {
      var response = await http
          .get(Uri.parse('$baseURL/admin/get-terms-and-conditions'), headers: {
        "Authorization": "bearer $token",
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = TacModel.fromJson(responsemap);

        return data;
      } else if (response.statusCode == 401) {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        return null;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);
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
