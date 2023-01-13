import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';

import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';

import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class MyAdsScreen extends StatefulWidget {
  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
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
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          elevation: 0,
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("My Ads.".tr(context)),
        ),
        body: Container(
          // height: myApplication.hightClc(context, 640),
          margin: const EdgeInsets.only(
            top: 8,
            right: 24,
            left: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///////////// Statistics
              const SizedBox(
                height: 12,
              ),
              Text(
                "Statistics".tr(context),
                style: const TextStyle(fontSize: 14, fontFamily: "Tajawal"),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: adsTaps.map((e) {
                      return Container(
                        height: 80,
                        width: 140,
                        margin: const EdgeInsets.only(right: 16),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  e["img"],
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "123",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(e["name"].toString().tr(context),
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                  )),
              const SizedBox(
                height: 25,
              ),

              ///////////// Search
              Text(
                "Ads.".tr(context),
                style: const TextStyle(fontSize: 14, fontFamily: "Tajawal"),
              ),
              const SizedBox(
                height: 4,
              ),
              SearchFilter(() => myApplication.navigateToRemove(
                  context, const AfterFilterAndSearch("result"))),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 550,
                child: ListView(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    BestAdsItem(
                      img: defaultHouse,
                      title: "test",
                      area: "test",
                      floors: "test",
                      statee: "test",
                      createdAt: DateTime.now(),
                      price: "test",
                      // isFavorite: null,
                    ),
                    BestAdsItem(
                      img: defaultHouse,
                      title: "test",
                      area: "test",
                      floors: "test",
                      statee: "test",
                      createdAt: DateTime.now(),
                      price: "test",
                      isFavorite: null,
                    ),
                    BestAdsItem(
                      img: defaultHouse,
                      title: "test",
                      area: "test",
                      floors: "test",
                      statee: "test",
                      createdAt: DateTime.now(),
                      price: "test",
                      isFavorite: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
