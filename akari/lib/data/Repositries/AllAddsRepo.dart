import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/all_adds_model/all_adds_model.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class AllAddsRepo {
  Future<AllAddsModel?> allAdds() async {
    try {
      print("object");
      var response = await http.post(Uri.parse('$baseURL/ads'), body: {});

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
        print("sts200");
        final data = AllAddsModel.fromJson(responsemap);
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
