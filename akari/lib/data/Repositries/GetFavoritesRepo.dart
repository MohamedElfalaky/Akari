import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/helpers/CacheHelper.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class GetFavoritesRepo {
  Future<GetFavoritesModel?> getFavorites(dynamic token) async {
    try {
      var response = await http
          .get(Uri.parse('$baseURL/user/get-all-favorites'), headers: {
        "Authorization": "bearer $token",
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = GetFavoritesModel.fromJson(responsemap);
        return data;
      } else if (response.statusCode == 401) {
        CacheHelper.removeFromShared("token");
        print("Token is cleared because user is not Authrized hhhh");
        return null;
      } else {
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
