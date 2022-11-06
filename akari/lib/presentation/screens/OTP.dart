import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/screens/Filter.dart';
import 'package:akari/presentation/widgets/ForgetPassword/ResetMail.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatelessWidget {
  OTP({super.key});
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 44.sp,
      height: 44.sp,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: Simplify.hightClc(context, 340),
                    color: Theme.of(context).colorScheme.tertiary,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/logo1.svg",
                    ))),
                Container(
                  height: Simplify.hightClc(context, 460),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: Simplify.widthClc(context, 24)),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Color(0xFF66718514),
                            blurRadius: 4)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.sp),
                          topRight: Radius.circular(30.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 24),
                            bottom: Simplify.hightClc(context, 16)),
                        child: Center(
                          child: AutoSizeText(
                            "Confirm Your Account",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                      Container(
                        width: Simplify.widthClc(context, 272),
                        margin: EdgeInsets.only(
                            bottom: Simplify.hightClc(context, 6)),
                        child: Center(
                          child: AutoSizeText(
                            "Enter Confirmation Code that has been sent to your email:",
                            style: TextStyle(
                                fontFamily: "Tajawal,Regular",
                                fontSize: 16,
                                color: Color(0xFF363A3D)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: Simplify.hightClc(context, 40)),
                        child: Center(
                          child: AutoSizeText(
                            " alimohamed@example.test",
                            style: TextStyle(
                                fontFamily: "Tajawal,Regular",
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        onCompleted: (pin) => print(pin),
                        controller: pinController,
                      ),
                      SizedBox(
                        height: Simplify.hightClc(context, 48),
                      ),
                      myButton(
                          () => showDialog(
                                context: context,
                                builder: (BuildContext myContext) {
                                  return ResetMail();
                                },
                              ),
                          "Confirm"),
                      SizedBox(
                        height: Simplify.hightClc(context, 16),
                      ),
                      AutoSizeText(
                        "04:49",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: Simplify.hightClc(context, 26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Don't receive any code!",
                            style: TextStyle(
                              fontFamily: "Tajawal,Regular",
                              color: Color(0XFF116A92),
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "/register");
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     "/register",
                                //     (Route<dynamic> route) => false);
                              },
                              child: AutoSizeText(" Resend",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(
                                        0XFFDC8035,
                                      ),
                                      fontSize: 16)))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
