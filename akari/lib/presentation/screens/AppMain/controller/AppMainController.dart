import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/data/cubits/MyAds/MyAdsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppMainController {
  ///vars

  ///methods
  void AppMainAPIs(
      {required BuildContext myContext,
      List<String> contractType = const [],
      List<String> buildingType = const [],
      int priceFrom = 1,
      int priceTo = 1000000000000000,
      int page = 1,
      int limit = 100,
      List<double> location = const [27, 16],
      int maxDistance = 10000000,
      String currency = "SP"}) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      AllAddsCubit.get(myContext).userAllAdds(
          contractType: contractType,
          buildingType: buildingType,
          priceFrom: priceFrom,
          priceTo: priceTo,
          page: page,
          limit: limit,
          location: location,
          maxDistance: maxDistance,
          currency: currency);
      if (CacheHelper.getFromShared("token") != null &&
          CacheHelper.getFromShared("isAdvertiser") == "yes") {
        MyAdsCubit.get(myContext).userMyAds(
            token: CacheHelper.getFromShared("token"), context: myContext);
        GetUserDataCubit.get(myContext).userGetUserData(
            userId: CacheHelper.getFromShared("id"),
            token: CacheHelper.getFromShared("token"));
      }
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
