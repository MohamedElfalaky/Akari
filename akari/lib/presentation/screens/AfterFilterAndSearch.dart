import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AppMain/components/AppMainScreen.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/AppMain/components/TabBarItem.dart';
import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';
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
          toolbarHeight: myApplication.hightClc(context, 140),
          elevation: 0,
          title: AfterFilterAppBar(widget.title),
        ),
        body: Container(
          height: myApplication.hightClc(context, 640),
          margin: EdgeInsets.only(
            top: myApplication.hightClc(context, 8),
            right: myApplication.widthClc(context, 24),
            left: myApplication.widthClc(context, 24),
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
