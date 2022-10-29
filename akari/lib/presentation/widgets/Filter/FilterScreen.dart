import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

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
                          children: <Widget>[
                            FilterTab("Rent"),
                            FilterTab("Investment"),
                            FilterTab("Selling"),
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
                      "Property Type",
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
                          children: <Widget>[
                            FilterTab("Flat"),
                            FilterTab("Building"),
                            FilterTab("Land"),
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
                          children: <Widget>[
                            FilterTab("allow animals"),
                            FilterTab("allow Smoking"),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Simplify.hightClc(context, 70),
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
                    Navigator.pushNamed(context, "/afterfilter");
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
