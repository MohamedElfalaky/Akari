import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: Simplify.hightClc(context, 16),
          // ),
          AutoSizeText(
            "Filters",
            style: TextStyle(fontSize: 24, fontFamily: "Tajawal,Medium"),
          ),
          SizedBox(
            height: Simplify.hightClc(context, 8),
          ),
          AutoSizeText(
            "Here you can find what you need!",
            style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
          ),
          SizedBox(
            height: Simplify.hightClc(context, 16),
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Simplify.widthClc(context, 272),
                height: Simplify.hightClc(context, 40),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                      hintText: "Search cities here !",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: Simplify.widthClc(context, 10),
                          bottom: Simplify.hightClc(context, 10)),
                      prefixIcon: Container(
                        margin: EdgeInsets.all(
                          5,
                        ),
                        child: SvgPicture.asset(
                            "assets/search-normal-twotone.svg"),
                      )),
                ),
              ),
              SizedBox(
                width: Simplify.widthClc(context, 8),
              ),
              SizedBox(
                width: Simplify.widthClc(context, 40),
                height: Simplify.hightClc(context, 40),
                child: SvgPicture.asset("assets/filter.svg"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
