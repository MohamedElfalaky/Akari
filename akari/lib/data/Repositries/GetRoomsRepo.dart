import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/get_rooms_model/get_rooms_model.dart';

import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class GetRoomsRepo {
  Future<GetRoomsModel?> getRooms(String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/chat/rooms'), headers: {
        "Authorization": "bearer $token",
      }, body: {});

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        final data = GetRoomsModel.fromJson(responsemap);
        myApplication.showToast(text: data.message!, color: Colors.green);
        return data;
      } else if (response.statusCode == 401) {
        final data = GetRoomsModel.fromJson(responsemap);
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
