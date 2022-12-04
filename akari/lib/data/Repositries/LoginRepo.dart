import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class LoginRepo {
  Future<LogInModel?> logIn(String mail, String pass) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/auth/login'),
          headers: headers, body: {"email": mail, "password": pass});

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        final data = LogInModel.fromJson(responsemap);

        return data;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);
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
    return null;
  }
}
