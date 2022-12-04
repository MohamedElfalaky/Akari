import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllCategoryAppBar extends StatelessWidget {
  const AllCategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: myApplication.widthClc(context, 12)),
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
            height: myApplication.hightClc(context, 36),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: myApplication.widthClc(context, 320),
                  height: myApplication.hightClc(context, 40),
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
                            left: myApplication.widthClc(context, 10),
                            bottom: myApplication.hightClc(context, 10)),
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
