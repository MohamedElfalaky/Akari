import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterTab extends StatelessWidget {
  final String valuee;
  FilterTab(this.valuee);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
          height: Simplify.hightClc(context, 24),
          padding: EdgeInsets.symmetric(
            horizontal: Simplify.widthClc(context, 8),
          ),
          margin:
              EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 4)),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(3)),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 13,
              ),
              AutoSizeText(
                valuee,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Tajawal,Regular",
                    color: Color(0xFF363A3D)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
