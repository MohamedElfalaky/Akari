import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Models/resend_otp/resend_otp.dart';
import 'package:akari/data/Models/varify_otp/varify_otp.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class ResendOtpRepo {
  Future<ResendOtpModel?> resendOtp(String mail) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/auth/resend-otp'),
          headers: headers, body: {"email": mail});

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        final data = ResendOtpModel.fromJson(responsemap);
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
    }
  }
}
