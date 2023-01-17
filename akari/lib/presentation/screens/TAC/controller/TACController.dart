import 'package:akari/data/cubits/TAC/TACCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';

class TACController {
  ///vars

  ///methods
  void TACAPIs(BuildContext context, String token) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      TACCubit.get(context).userTAC(token: token);
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
