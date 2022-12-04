import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../helpers/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class ResetMail extends StatefulWidget {
  @override
  State<ResetMail> createState() => _ResetMailState();
}

class _ResetMailState extends State<ResetMail> {
  int navigateTothisIndex = 4;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0.sp))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: EdgeInsets.all(1.sp),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close)),
              ],
            ),
            SvgPicture.asset("assets/Enter OTP-bro.svg"),
            Container(
              margin: EdgeInsets.only(
                  top: myApplication.hightClc(context, 24),
                  bottom: myApplication.hightClc(context, 8)),
              child: Center(
                child: Text(
                  "Recover mail successfully sent",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(bottom: myApplication.hightClc(context, 16)),
              child: Center(
                child: Text(
                  "password recovery mail has been successfully sent to your email: name@example.test",
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
              myApplication.navigateTo(LogIn(), context);
            }, "Done"),
          ])),
    );
    ;
  }
}
