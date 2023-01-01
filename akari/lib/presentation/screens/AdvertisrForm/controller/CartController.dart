import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class GetFavoritesController {
  ///vars

  ///methods
  void getFavoritesAPIs(BuildContext context) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      GetFavoritesCubit.get(context)
          .userGetFavorites(CacheHelper.getFromShared("token"));
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
