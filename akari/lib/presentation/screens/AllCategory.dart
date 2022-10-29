import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AllCategory/AllCategoryAppBar.dart';
import 'package:akari/presentation/widgets/AppMain/AppMainScreen.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterAppBar.dart';
import 'package:akari/presentation/widgets/Filter/FilterScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
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
          toolbarHeight: Simplify.hightClc(context, 145),
          elevation: 0,
          title: AllCategoryAppBar(),
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: Simplify.widthClc(context, 24),
            right: Simplify.widthClc(context, 24),
            top: Simplify.hightClc(context, 24),
          ),
          child: StaggeredGrid.count(crossAxisCount: 3, children: <Widget>[
            TabBarItem("Flat", "assets/flat.svg"),
            TabBarItem("Bulding", "assets/building.svg"),
            TabBarItem("Land", "assets/land.svg"),
            TabBarItem("Office", "assets/Office.svg"),
            TabBarItem("Duplex", "assets/Duplex.svg"),
            TabBarItem("Tent", "assets/Tent.svg"),
            TabBarItem("Farm", "assets/Farm.svg"),
            TabBarItem("Room", "assets/Room.svg"),
            TabBarItem("Villa", "assets/Villa.svg"),
            TabBarItem("Chalet", "assets/Chalet.svg"),
            TabBarItem("Hut", "assets/Hut.svg"),
            TabBarItem("Lounge", "assets/Lounge.svg"),
            TabBarItem("Store", "assets/Store.svg"),
            TabBarItem("Ware house", "assets/Ware house.svg"),
            TabBarItem("Appartment", "assets/Appartment.svg"),
            TabBarItem("furnished apartments", "furnished apartments"),
          ]),
        ),
      ),
    );
  }
}
