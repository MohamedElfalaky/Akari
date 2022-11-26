import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> contractTapsList = [];
  final List<String> filterTapsList = [];
  final List<String> unitLawsTapsList = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: Simplify.widthClc(context, 8),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Simplify.widthClc(context, 16),
                  vertical: Simplify.hightClc(context, 16),
                ),
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Contract Type",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Tajawal",
                          color: Color(0xFF363A3D)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 19)),
                        child: Row(
                          // scrollDirection: Axis.horizontal,
                          children:
                              contractTaps // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                                  .map((e) => InkWell(
                                        child: FilterTab(e["name"], e["bool"]),
                                        onTap: () {
                                          if (contractTapsList
                                                  .where((element) =>
                                                      element == e["name"])
                                                  .isNotEmpty &&
                                              contractTapsList
                                                      .where((element) =>
                                                          element == e["name"])
                                                      .first ==
                                                  e["name"]) {
                                            setState(() {
                                              contractTapsList
                                                  .remove(e["name"]);
                                              e["bool"] = false;
                                            });
                                          } else {
                                            setState(() {
                                              contractTapsList.add(e["name"]);
                                              e["bool"] = true;
                                            });
                                          }
                                          print(contractTapsList);
                                        },
                                      ))
                                  .toList(),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 8),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: Simplify.widthClc(context, 16),
                  vertical: Simplify.hightClc(context, 16),
                ),
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Property Type",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Tajawal",
                          color: Color(0xFF363A3D)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 19)),
                        child: Wrap(
                            children: myTaps
                                .map((e) => InkWell(
                                      child: FilterTab(e["name"], e["bool"]),
                                      onTap: () {
                                        // filterTapsList.removeWhere(
                                        //     (element) => element == e["name"]);

                                        if (filterTapsList
                                                .where((element) =>
                                                    element == e["name"])
                                                .isNotEmpty &&
                                            filterTapsList
                                                    .where((element) =>
                                                        element == e["name"])
                                                    .first ==
                                                e["name"]) {
                                          setState(() {
                                            filterTapsList.remove(e["name"]);
                                            e["bool"] = false;
                                          });
                                        } else {
                                          setState(() {
                                            filterTapsList.add(e["name"]);
                                            e["bool"] = true;
                                          });
                                        }
                                      },
                                    ))
                                .toList())),
                  ],
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 8),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Simplify.widthClc(context, 16),
                  vertical: Simplify.hightClc(context, 16),
                ),
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Price ( SD )",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Tajawal",
                          color: Color(0xFF363A3D)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 16)),
                        height: Simplify.hightClc(context, 40),
                        child: Row(
                          // scrollDirection: Axis.horizontal,
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 249, 215),
                                  filled: true,
                                  hintText: "From",
                                  border: InputBorder.none),
                            )),
                            SizedBox(
                              width: Simplify.widthClc(context, 8),
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 249, 215),
                                  filled: true,
                                  hintText: "To",
                                  border: InputBorder.none),
                            ))
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 8),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Simplify.widthClc(context, 16),
                  vertical: Simplify.hightClc(context, 16),
                ),
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Unit Laws",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Tajawal",
                          color: Color(0xFF363A3D)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Simplify.hightClc(context, 19)),
                        child: Row(
                          // scrollDirection: Axis.horizontal,
                          children:
                              unitLawsTaps // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                                  .map((e) => InkWell(
                                        child: FilterTab(e["name"], e["bool"]),
                                        onTap: () {
                                          if (unitLawsTapsList
                                                  .where((element) =>
                                                      element == e["name"])
                                                  .isNotEmpty &&
                                              unitLawsTapsList
                                                      .where((element) =>
                                                          element == e["name"])
                                                      .first ==
                                                  e["name"]) {
                                            setState(() {
                                              unitLawsTapsList
                                                  .remove(e["name"]);
                                              e["bool"] = false;
                                            });
                                          } else {
                                            setState(() {
                                              unitLawsTapsList.add(e["name"]);
                                              e["bool"] = true;
                                            });
                                          }
                                          print(unitLawsTapsList);
                                        },
                                      ))
                                  .toList(),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 50),
              ),
              Container(
                height: Simplify.hightClc(context, 45),
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: Simplify.widthClc(context, 32)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(23))),
                    // textStyle: TextStyle(fontWeight: FontWeight.normal),
                    elevation: 0,
                    backgroundColor: Color(0XFFDC8035),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                AfterFilterAndSearch("Filter relust")));
                  },
                  child: Center(
                      child: AutoSizeText(
                    "Confirm",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Tajawal",
                        fontSize: 16,
                        color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 8),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Simplify.widthClc(context, 32)),
                child: TextButton(
                  onPressed: () {},
                  child: AutoSizeText(
                    "Reset Filters",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Tajawal",
                        fontSize: 16,
                        color: Color(0XFFB00020)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
