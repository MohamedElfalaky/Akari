import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
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
            left: myApplication.widthClc(context, 16),
            right: myApplication.widthClc(context, 16),
            top: myApplication.widthClc(context, 16),
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
                  margin:
                      EdgeInsets.only(top: myApplication.hightClc(context, 8)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: categoryTaps),
                  )),
              Container(
                  margin:
                      EdgeInsets.only(top: myApplication.hightClc(context, 24)),
                  child: AutoSizeText(
                    "Best Ads",
                    style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                  )),
              Container(
                height: myApplication.hightClc(context, 447),
                margin:
                    EdgeInsets.only(top: myApplication.hightClc(context, 8)),
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
