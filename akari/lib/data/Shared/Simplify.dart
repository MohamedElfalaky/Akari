import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Simplify {
  static double hightClc(BuildContext context, int myHeight) {
    return MediaQuery.of(context).size.height * myHeight / 812;
  }

  static double widthClc(BuildContext context, int myWidth) {
    return MediaQuery.of(context).size.width * myWidth / 375;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  static navigateToReplace(Widget page, BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  static showToast({
    required String text,
    required color,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
