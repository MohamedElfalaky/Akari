import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Models/page1_model/page1_model.dart';
import 'package:akari/data/Models/page2_appartment_model/page2_appartment_model.dart';
import 'package:akari/data/Models/page2_villa_model/page2_villa_model.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../App/constants.dart';

class AddAdvertiseRepo {
  Future<Page1Model?> page1(
      String buildingType, String contractType, String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/create'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "buildingType": buildingType,
        "contractType": contractType,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 201 && responsemap["result"] == true) {
        final data = Page1Model.fromJson(responsemap);
        myApplication.showToast(text: "${data.message!}", color: Colors.green);
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

  Future<Page2AppartmentModel?> Page2Appartment(
      String title,
      String subType,
      int area,
      int bedroomsCount,
      int bathroomCount,
      int floor,
      String deliveryTerm,
      String renterType,
      List<String> rentFrequency,
      String description,
      String id,
      String token) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/ads/$id/apartmentDetails'),
        headers: {
          "Authorization": "bearer $token",
          // 'Content-type': 'application/json',
          // 'Accept': 'application/json',
        },
        body: {
          "title": title,
          "subType": subType,
          "area": area.toString(),
          "bedroomsCount": bedroomsCount.toString(),
          "bathroomCount": bathroomCount.toString(),
          "floor": floor.toString(),
          "deliveryTerm": deliveryTerm,
          "renterType": renterType,
          "rentFrequency": jsonEncode(rentFrequency),
          "description": description,
        },

        // encoding: Encoding.getByName("encoding")
      );

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        final data = Page2AppartmentModel.fromJson(responsemap);
        myApplication.showToast(
            text: "page 2 ${data.message!}", color: Colors.green);
        return data;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);
        print(responsemap["errors"]["body"][0]["message"]);
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

  ///////////////////////////////////////
  Future<dynamic> Page2Villa(
    String title,
    String subType,
    int area,
    int bedroomsCount,
    int bathroomCount,
    int floor,
    String deliveryTerm,
    String renterType,
    List<String> rentFrequency,
    String description,
    String id,
    String token,
  ) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/$id/villaDetails'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "title": title,
        "subType": subType,
        "area": area.toString(),
        "bedroomsCount": bedroomsCount.toString(),
        "bathroomCount": bathroomCount.toString(),
        "floor": floor,
        "deliveryTerm": deliveryTerm,
        "renterType": renterType,
        "rentFrequency": jsonEncode(rentFrequency),
        "description": description,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = Page2VillaModel.fromJson(responsemap);
        myApplication.showToast(
            text: "page 2 ${responsemap["message"]}", color: Colors.green);
        return responsemap;
      } else {
        myApplication.showToast(
            text: responsemap["message"], color: Colors.red);

        print(responsemap["errors"]["body"][0]["message"]);

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

  ///////////////////////

  Future<dynamic> page3(String buildingType, String id, String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/upload/image/$id'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "buildingType": buildingType,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = dynamic.fromJson(responsemap);
        myApplication.showToast(
            text: responsemap["message"], color: Colors.green);
        return responsemap;
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

  //////////////
  Future<dynamic> addAminties(
      List<String> amintiesList, String id, String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/$id/amenities'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "amenities": jsonEncode(amintiesList),
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = dynamic.fromJson(responsemap);
        myApplication.showToast(
            text: responsemap["message"], color: Colors.green);
        return responsemap;
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
  ///////////////////////////////////////////////////

  Future<dynamic> addAddress(String state, String district,
      String detailedAddress, String POBox, String id, String token) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/$id/address'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "state": state,
        "district": district,
        "detailedAddress": detailedAddress,
        "POBox": POBox,
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = dynamic.fromJson(responsemap);
        myApplication.showToast(
            text: responsemap["message"], color: Colors.green);
        return responsemap;
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
  ///////////////////////////////////////////////////

  Future<dynamic> addPrice(
      {required String inUSD,
      required String inSP,
      required String paymentOption,
      required String downPaymentPercentage,
      required bool onlyAcceptUSD,
      required bool isNegotiable,
      required String id,
      required String token}) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/$id/price'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "inUSD": inUSD,
        "inSP": inSP,
        "paymentOption": paymentOption,
        "onlyAcceptUSD": jsonEncode(onlyAcceptUSD),
        "isNegotiable": jsonEncode(isNegotiable),
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = dynamic.fromJson(responsemap);
        myApplication.showToast(
            text: responsemap["message"], color: Colors.green);
        return responsemap;
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

  ///////////////////////////////////

  Future<dynamic> confirmAdd(
      {required String name,
      required String mobileNumber,
      required String capacity,
      required String contactMethod,
      required bool termsAccepted,
      required String id,
      required String token}) async {
    try {
      var response =
          await http.post(Uri.parse('$baseURL/ads/$id/advertiser'), headers: {
        "Authorization": "bearer $token",
      }, body: {
        "name": name,
        "mobileNumber": mobileNumber,
        "capacity": capacity,
        "contactMethod": contactMethod,
        "termsAccepted": termsAccepted.toString(),
      });

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["result"] == true) {
        // final data = dynamic.fromJson(responsemap);
        myApplication.showToast(
            text: responsemap["message"], color: Colors.green);
        return responsemap;
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
