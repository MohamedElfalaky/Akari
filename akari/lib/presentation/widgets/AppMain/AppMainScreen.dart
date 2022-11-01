import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: Simplify.widthClc(context, 16),
            right: Simplify.widthClc(context, 16),
            top: Simplify.widthClc(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AutoSizeText(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/allcategory"),
                    child: AutoSizeText(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Tajawal,Regular",
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  )
                ],
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: Simplify.hightClc(context, 8)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // scrollDirection: Axis.horizontal,
                      children: [
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
                        TabBarItem(
                            "furnished apartments", "furnished apartments"),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: Simplify.hightClc(context, 24)),
                  child: AutoSizeText(
                    "Best Ads",
                    style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                  )),
              Container(
                height: Simplify.hightClc(context, 447),
                margin: EdgeInsets.only(top: Simplify.hightClc(context, 8)),
                child: ListView(
                  children: [
                    BestAdsItem(),
                    BestAdsItem(),
                    BestAdsItem(),
                    BestAdsItem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
