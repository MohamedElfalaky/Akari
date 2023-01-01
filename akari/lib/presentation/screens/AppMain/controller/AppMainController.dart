import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppMainController {
  ///vars

  ///methods
  void AppMainAPIs(BuildContext context) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      AllAddsCubit.get(context).userAllAdds();
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
