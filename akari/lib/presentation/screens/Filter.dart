import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/AppMain/AppMainScreen.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // remove back button in appbar.

          backgroundColor: Color(0xFFFFFFFF),
          toolbarHeight: myApplication.hightClc(context, 155),
          elevation: 0,
          title: FilterAppBar(),
        ),
        body: FilterScreen(),
      ),
    );
  }
}
