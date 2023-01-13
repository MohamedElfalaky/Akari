import 'package:flutter/material.dart';

// ignore: camel_case_types
class myButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final myHandler;
  final String buttonName;
  final Color? btnClr;
  final Color? txtClr;
  final Widget? btnIcon;

  const myButton(
    this.myHandler,
    this.buttonName, {
    super.key,
    this.btnClr,
    this.txtClr,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        // width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: txtClr ?? Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            textStyle: const TextStyle(fontWeight: FontWeight.normal),
            elevation: 0,
            backgroundColor: btnClr ?? const Color(0XFFDC8035),
          ),
          onPressed: myHandler,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnIcon ?? Container(),
              Text(
                buttonName,
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
