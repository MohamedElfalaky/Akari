import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.symmetric(
                      vertical: Simplify.hightClc(context, 22),
                    ),
                    color: Theme.of(context).colorScheme.tertiary,
                    child:
                        Center(child: SvgPicture.asset("assets/logoRege.svg"))),
                Container(
                  height: Simplify.hightClc(context, 672),
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 16),
                            bottom: Simplify.hightClc(context, 8)),
                        child: AutoSizeText(
                          "Create Account",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: Simplify.hightClc(context, 24)),
                        child: AutoSizeText(
                          "Be part of Aqari Now !",
                          style: TextStyle(
                              fontFamily: "Tajawal,Regular",
                              fontSize: 13,
                              color: Color(0xFF363A3D)),
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
                          hint: "Name",
                          prefix: "assets/registerPics/user-bulk.svg",
                          suffix: ""),
                      SizedBox(
                        height: Simplify.hightClc(context, 16),
                      ),
                      myTextField(
                        hint: "Mobile",
                        prefix: "assets/registerPics/call-bulk.svg",
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
                        height: Simplify.hightClc(context, 16),
                      ),
                      myTextField(
                        hint: "Confirm Password",
                        prefix: "assets/registerPics/vuesax-bulk-lock.svg",
                        suffix: "",
                      ),
                      SizedBox(
                        height: Simplify.hightClc(context, 32),
                      ),
                      myButton(null, "Create Account"),
                      SizedBox(
                        height: Simplify.hightClc(context, 24),
                      ),
                      AlreadyHaveAccount(() =>
                          Navigator.pushReplacementNamed(context, "/login")),
                      SizedBox(
                        height: Simplify.hightClc(context, 24),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "By creating account you accept Smart Building",
                            style: TextStyle(
                              fontFamily: "Tajawal,Regular",
                              color: Color(0XFF363A3D),
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: AutoSizeText("Terms and conditions",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 14)))
                        ],
                      )
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
