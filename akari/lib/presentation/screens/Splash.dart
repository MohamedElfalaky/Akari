import 'dart:async';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';
import 'package:akari/style/Icons.dart';

import 'package:akari/presentation/screens/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      myApplication.navigateToReplace(
          CacheHelper.getFromShared("token") == null ? OnBoarding() : AppMain(),
          context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/background_pattarn.svg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(child: Image.asset(mainLogo))),
      ],
    );
  }
}
