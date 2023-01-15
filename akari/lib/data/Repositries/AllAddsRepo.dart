import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/AllAddsModel.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class AllAddsRepo {
  Future<AllAddsModel?> allAdds(
      {List<String> contractType = const [],
      List<String> buildingType = const [],
      int priceFrom = 1,
      int priceTo = 1000000000000000,
      int page = 1,
      int limit = 100,
      List<double> location = const [27, 16],
      int maxDistance = 10000000,
      String currency = "SP"}) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/ads'), body: {
        "contractType": jsonEncode(contractType),
        "buildingType": jsonEncode(buildingType),
        "priceFrom": priceFrom.toString(),
        "priceTo": priceTo.toString(),
        "page": page.toString(),
        "limit": limit.toString(),
        "sortField": "createdAt",
        "sortDirection": "desc",
        "currency": currency
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
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

  ////////////
  ///
  ///

  Future<AllAddsModel?> adsByState({required String myState}) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/ads'), body: {
        "state": myState,
        "priceFrom": "1",
        "priceTo": "1000000000000000",
        "page": "1",
        "limit": "100",
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
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
  ////////////////
  ///
  ///
  ///
  ///

  Future<AllAddsModel?> adsByFilter(
      {required String myState,
      List<String> contractType = const [],
      List<String> propertyType = const [],
      String? initialPrice,
      String? finalPrice}) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/ads'), body: {
        "state": myState,
        "contractType": jsonEncode(contractType),
        "buildingType": jsonEncode(propertyType),
        "priceFrom": initialPrice ?? "1",
        "priceTo": finalPrice ?? "10000000000000",
        "page": "1",
        "limit": "100",
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = AllAddsModel.fromJson(responsemap);
        return data;
      } else {
        print("Nullllll");
        print(responsemap["message"]);
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
