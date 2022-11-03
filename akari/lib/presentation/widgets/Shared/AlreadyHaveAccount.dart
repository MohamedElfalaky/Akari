import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final navigateHandler;
  const AlreadyHaveAccount(this.navigateHandler);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "already have an account!",
          style: TextStyle(
            fontFamily: "Tajawal",
            color: Color(0XFF116A92),
            fontSize: 16,
          ),
        ),
        InkWell(
            onTap: () {
              navigateHandler();
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     "/login", (Route<dynamic> route) => false);
            },
            child: AutoSizeText(" sign in",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    color: Color(
                      0XFFDC8035,
                    ),
                    fontSize: 16)))
      ],
    );
  }
}
