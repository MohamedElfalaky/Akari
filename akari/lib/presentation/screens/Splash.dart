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
    final Widget svg = SvgPicture.asset('TalabatLogo'.tr(context),
        color: Color(0xffEDEDF4), semanticsLabel: 'Acme Logo');
    return Scaffold(
        backgroundColor: Color(0xFFF5504C),
        body: Center(child: Center(child: svg)));
  }
}
