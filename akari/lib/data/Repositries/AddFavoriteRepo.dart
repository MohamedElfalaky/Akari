import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class AddFavoriteRepo {
  Future<AddToFavoriteModel?> addFavorite(
      String advertisementId, String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/user/add-to-favorite'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "advertisementId": advertisementId,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        final data = AddToFavoriteModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${data.message!} to favorites", color: Colors.green);
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
  ////////////////////

  Future<AddToFavoriteModel?> removeFavorite(
      String advertisementId, String token) async {
    try {
      var response = await http
          .post(Uri.parse('$baseURL/user/remove-from-favorite'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "advertisementId": advertisementId,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        final data = AddToFavoriteModel.fromJson(responsemap);
        myApplication.showToast(
            text: "${data.message!} from favorites", color: Colors.green);
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
