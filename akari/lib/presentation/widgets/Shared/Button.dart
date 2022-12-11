import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final myHandler;
  final String buttonName;

  const myButton(
    this.myHandler,
    this.buttonName,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        // width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(23))),
            textStyle: TextStyle(fontWeight: FontWeight.normal),
            elevation: 0,
            backgroundColor: Color(0XFFDC8035),
          ),
          onPressed: myHandler,
          child: Center(
              child: AutoSizeText(
            buttonName,
            style: TextStyle(
                fontFamily: "Tajawal", fontSize: 16, color: Colors.white),
          )),
        ));
  }
}
