import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllCategoryAppBar extends StatelessWidget {
  const AllCategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AutoSizeText(
                "All Categories",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Tajawal,Medium",
                    color: Color(0xFF363A3D)),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Color(0xFF363A3D),
                ),
              )
            ],
          ),
          SizedBox(
            height: Simplify.hightClc(context, 36),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Simplify.widthClc(context, 320),
                  height: Simplify.hightClc(context, 40),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorHeight: 25,
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        hintText: "Find your state here !",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 47, 44, 44))),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(70707033))),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
