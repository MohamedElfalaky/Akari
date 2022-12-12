import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final myHandler;
  final String buttonName;
  final Color? btnClr;
  final Color? txtClr;
  final Widget? btnIcon;

  const myButton(this.myHandler, this.buttonName,
      {this.btnClr, this.txtClr, this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        // width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: txtClr ?? Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(23))),
            textStyle: TextStyle(fontWeight: FontWeight.normal),
            elevation: 0,
            backgroundColor: btnClr ?? Color(0XFFDC8035),
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
