import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchFilter extends StatelessWidget {
  final searchHandler;
  const SearchFilter(this.searchHandler);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Color(0XFF363A3D1A), width: 2)),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Color(0XFF363A3D1A), width: 1.5),
                ),
                contentPadding: EdgeInsets.only(
                    left: Simplify.widthClc(context, 10),
                    bottom: Simplify.hightClc(context, 10)),
                prefixIcon: InkWell(
                  onTap: () => searchHandler(),
                  child: Container(
                    margin: EdgeInsets.all(
                      5,
                    ),
                    child: SvgPicture.asset("assets/search-normal-twotone.svg"),
                  ),
                )),
          ),
        ),
        SizedBox(
          width: Simplify.widthClc(context, 8),
        ),
        InkWell(
          onTap: (() => Navigator.pushNamed(context, "/filter")),
          child: SizedBox(
            width: Simplify.widthClc(context, 40),
            height: Simplify.hightClc(context, 40),
            child: SvgPicture.asset("assets/filter.svg"),
          ),
        ),
      ],
    );
  }
}
