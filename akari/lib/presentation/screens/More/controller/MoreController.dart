import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/data/cubits/MyAds/MyAdsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MoreController {
  ///vars

  ///methods
  void MoreAPIs({
    required BuildContext myContext,
  }) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      if (CacheHelper.getFromShared("token") != null &&
          CacheHelper.getFromShared("isAdvertiser") == "yes") {
        MyAdsCubit.get(myContext).userMyAds(
            token: CacheHelper.getFromShared("token"), context: myContext);
      }
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
