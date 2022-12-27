import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ChatController {
  ///vars

  ///methods
  void ChatAPIs(BuildContext context, String token) async {
    final bool result = await myApplication.checkInternet();
    if (!result) {
      myApplication.showToast(
          text: "No Internet connection | لا يوجد اتصال", color: Colors.red);
    } else {
      // ChatItemsCubit.get(context).getChatItems(token);
      // TotalFeeCubit.get(context).getTotalFee(token);
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
