import 'dart:async';
import '../../data/Shared/AppLocalizations.dart';
import 'package:akari/presentation/screens/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: SvgPicture.asset('assets/background_pattarn.svg'),
        ),
        Center(
            child: SvgPicture.asset(
          'assets/logo.svg',
        )),
      ],
    ));
  }
}
