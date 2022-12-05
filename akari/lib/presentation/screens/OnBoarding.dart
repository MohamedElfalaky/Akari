import 'dart:async';
import 'dart:ui';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../helpers/myApplication.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Color(0XFFF4F4F4),
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 1,
                child: PageView(
                  controller: controller,
                  children: [
                    buildBlur(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0XFFF4F4F4),
                              ),
                              // color: Color(0XFFFFFFFF),
                              child: Center(
                                child: Image.asset("assets/illustration.png"),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "Find what you want",
                                  style: TextStyle(
                                      color: Color(0xFFDC8035),
                                      fontSize: 24,
                                      fontFamily: "Tajawal"),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              16 /
                                              375),
                                  child: AutoSizeText(
                                    textAlign: TextAlign.center,
                                    "Through a Smart Building application, you can search for real estate, land, or furnished units for sale, rent or investment",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Tajawal"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildBlur(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0XFFF4F4F4),
                                  borderRadius: BorderRadius.circular(30)),
                              // color: Color(0XFFFFFFFF),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/illustration.svg")),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "Earn With Smart Building",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFFDC8035),
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              16 /
                                              375),
                                  child: AutoSizeText(
                                    textAlign: TextAlign.center,
                                    "Through a Smart Building application, you can search for real estate, land, or furnished units for sale, rent or investment",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: "Tajawal"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildBlur(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0XFFF4F4F4),
                                  borderRadius: BorderRadius.circular(30)),
                              // color: Color(0XFFFFFFFF),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/illustration (1).svg")),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "Find what you want",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFFDC8035),
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              16 /
                                              375),
                                  child: AutoSizeText(
                                    textAlign: TextAlign.center,
                                    "Through a Smart Building application, you can search for real estate, land, or furnished units for sale, rent or investment",
                                    style: TextStyle(
                                        fontFamily: "Tajawal", fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFFFFFFF),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        spacing: 5, dotWidth: 10, dotHeight: 10),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              color: Color(0xFFFFFFFF),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height * 40 / 812,
                  top: myApplication.hightClc(context, 40),
                  left: myApplication.widthClc(context, 32),
                  right: MediaQuery.of(context).size.width * 32 / 375),
              child: Column(
                children: [
                  myButton(() => Navigator.pushNamed(context, "/register"),
                      "Create Account"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 16 / 812,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 45 / 812,
                      width: MediaQuery.of(context).size.width * 311 / 375,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0XFF116A92)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23))),
                          textStyle: TextStyle(fontWeight: FontWeight.normal),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/appmain");
                        },
                        child: Center(
                            child: AutoSizeText(
                          "Continue as aguest",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 16,
                              color: Color(0XFF116A92)),
                        )),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 32 / 812,
                  ),
                  AlreadyHaveAccount(
                      () => Navigator.pushNamed(context, "/login"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBlur(
          {required Widget child, double sigmaX = 10, double sigmaY = 10}) =>
      ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
          child: child,
        ),
      );
}
