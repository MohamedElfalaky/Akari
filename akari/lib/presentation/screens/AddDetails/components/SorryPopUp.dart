import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/Register.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SorryPopUp extends StatefulWidget {
  @override
  State<SorryPopUp> createState() => _SorryPopUpState();
}

class _SorryPopUpState extends State<SorryPopUp> {
  int navigateTothisIndex = 4;
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
            height: 380,
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
                  SvgPicture.asset(sorryy),
                  Container(
                    margin: EdgeInsets.only(
                        top: myApplication.hightClc(context, 24),
                        bottom: myApplication.hightClc(context, 8)),
                    child: Center(
                      child: Text(
                        "you aren't a user",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: myApplication.hightClc(context, 16)),
                    child: Center(
                      child: Text(
                        "Create account now and start using smart building",
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
                    myApplication.navigateTo(Register(), context);
                  }, "Create account"),
                ]),
          )),
    );
    ;
  }
}
