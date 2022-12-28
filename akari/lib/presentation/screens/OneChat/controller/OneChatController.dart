import 'package:akari/data/cubits/GetMassages/GetMassagesCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class OneChatController {
  ///vars

  ///methods
  void oneChatAPIs(BuildContext context, String token, String roomId) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      GetMassagesCubit.get(context)
          .userGetMassages(token: token, roomId: roomId);
    }
  }
}
