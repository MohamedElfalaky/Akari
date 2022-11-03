import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: Simplify.hightClc(context, 350),
                      color: Theme.of(context).colorScheme.tertiary,
                      child: Center(
                          child: SvgPicture.asset("assets/LoginLogo.svg"))),
                  Container(
                    height: Simplify.hightClc(context, 440),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: Simplify.hightClc(context, 16),
                              bottom: Simplify.hightClc(context, 8)),
                          child: Center(
                            child: AutoSizeText(
                              "Login",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 24,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: Simplify.hightClc(context, 24)),
                          child: Center(
                            child: AutoSizeText(
                              "Welcome to Smart Building!",
                              style: TextStyle(
                                  fontFamily: "Tajawal,Regular",
                                  fontSize: 13,
                                  color: Color(0xFF363A3D)),
                            ),
                          ),
                        ),
                        myTextField(
                          hint: "Email",
                          prefix: "assets/registerPics/vuesax-bulk-sms.svg",
                          suffix: "",
                        ),
                        SizedBox(
                          height: Simplify.hightClc(context, 16),
                        ),

                        myTextField(
                          hint: "Password",
                          prefix: "assets/registerPics/vuesax-bulk-lock.svg",
                          suffix: "",
                        ),
                        SizedBox(
                          height: Simplify.hightClc(context, 8),
                        ),

                        InkWell(
                            child: AutoSizeText(
                          "Forget password ?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Tajawal,Regular",
                              color: Theme.of(context).colorScheme.secondary),
                        )),

                        //forgetpass

                        //zorar login//

                        SizedBox(
                          height: Simplify.hightClc(context, 32),
                        ),
                        myButton(null, "Log in"),
                        SizedBox(
                          height: Simplify.hightClc(context, 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Don't have an account!",
                              style: TextStyle(
                                fontFamily: "Tajawal",
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
                                child: AutoSizeText("  sign up",
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        color: Color(
                                          0XFFDC8035,
                                        ),
                                        fontSize: 16)))
                          ],
                        ),
                        SizedBox(
                          height: Simplify.hightClc(context, 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
