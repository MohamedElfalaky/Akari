import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Models/register_model/register_model.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class RegisterRepo {
  Future<RegisterModel?> register(
      String name, String mail, String pass, String phone) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/auth/register'),
          headers: headers,
          body: {
            "name": name,
            "email": mail,
            "password": pass,
            "phone": phone
          });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 201 && responsemap["result"] == true) {
        final data = RegisterModel.fromJson(responsemap);
        myApplication.showToast(text: data.message!, color: Colors.green);
        return data;
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
    } catch (e) {
      print(e);
    }
    return null;
  }
}
