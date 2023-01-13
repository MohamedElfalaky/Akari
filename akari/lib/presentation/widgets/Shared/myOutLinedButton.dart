import 'package:akari/helpers/AppLocalizations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class myOutLinedButton extends StatelessWidget {
  final myHandler;
  final String buttonName;
  final Color? btnClr;
  final Color? txtClr;
  final Widget? btnIcon;
  final int? btnType;

  const myOutLinedButton(this.myHandler, this.buttonName,
      {super.key, this.btnClr, this.txtClr, this.btnIcon, this.btnType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        // width: 100,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: txtClr ?? Theme.of(context).colorScheme.primary),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: txtClr ?? Theme.of(context).colorScheme.primary),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            textStyle: const TextStyle(fontWeight: FontWeight.normal),
            elevation: 0,
            // backgroundColor: btnClr ?? Color(0XFFDC8035),
          ),
          onPressed: myHandler,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnIcon ?? Container(),
              Text(
                buttonName.tr(context),
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 16,
                    color: txtClr ?? Colors.white),
              ),
            ],
          )),
        ));
  }
}
