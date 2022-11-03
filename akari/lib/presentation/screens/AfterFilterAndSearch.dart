import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AppMain/AppMainScreen.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/presentation/widgets/Filter/AfterFilterAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterScreen.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AfterFilterAndSearch extends StatefulWidget {
  final title;
  const AfterFilterAndSearch(this.title);

  @override
  State<AfterFilterAndSearch> createState() => _AfterFilterAndSearchState();
}

class _AfterFilterAndSearchState extends State<AfterFilterAndSearch> {
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
          toolbarHeight: Simplify.hightClc(context, 140),
          elevation: 0,
          title: AfterFilterAppBar(widget.title),
        ),
        body: Container(
          height: Simplify.hightClc(context, 640),
          margin: EdgeInsets.only(
            top: Simplify.hightClc(context, 8),
            right: Simplify.widthClc(context, 24),
            left: Simplify.widthClc(context, 24),
          ),
          child: ListView(
            children: [
              BestAdsItem(),
              BestAdsItem(),
              BestAdsItem(),
              BestAdsItem(),
            ],
          ),
        ),
        floatingActionButton: ViewOnMap(),

        // floatingActionButtonLocation: FloatingActionButtonLocation,
      ),
    );
  }
}
