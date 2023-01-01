import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/Register.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BecomeAdvertisorPopUp extends StatefulWidget {
  @override
  State<BecomeAdvertisorPopUp> createState() => _BecomeAdvertisorPopUpState();
}

class _BecomeAdvertisorPopUpState extends State<BecomeAdvertisorPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: EdgeInsets.all(1),
          child: Container(
            width: 300,
            height: 360,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close)),
                    ],
                  ),
                  SvgPicture.asset(becomeAdvertisor),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 8),
                    child: Center(
                      child: Text(
                        "You must have Advertiser Account",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Center(
                      child: Text(
                        "You must apply to become an advertiser so, you can continue adding new Ads.",
                        style: TextStyle(
                            fontFamily: "Tajawal,Regular",
                            fontSize: 13,
                            color: Color(0xFF363A3D)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  myButton(() {
                    Navigator.pop(context);
                    // myApplication.navigateTo(Register(), context);
                  }, "Become an Advertiser"),
                ]),
          )),
    );
    ;
  }
}
