import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class GetUserDataRepo {
  Future<GetUserDataModel?> getUserData(
      {required String userID, required String token}) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/user/get-user'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "userId": userID,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = GetUserDataModel.fromJson(responsemap);
        return data;
      } else {
        print("Nullllll");
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
