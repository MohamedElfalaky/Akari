import 'package:flutter/material.dart';
import '../../../helpers/AppLocalizations.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final navigateHandler;
  const AlreadyHaveAccount(this.navigateHandler);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "already have an account!".tr(context),
          style: const TextStyle(
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
            child: Text(" sign in".tr(context),
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    color: Color(
                      0XFFDC8035,
                    ),
                    fontSize: 16)))
      ],
    );
  }
}
