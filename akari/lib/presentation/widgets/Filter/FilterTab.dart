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
      // style: ElevatedButton.styleFrom( // if i decided to make elevated button
      //   padding: EdgeInsets.all(1),
      //   elevation: 0,
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
      // ),
      onTap: () {},
      child: Card(
        child: Container(
          height: Simplify.hightClc(context, 24),
          padding: EdgeInsets.symmetric(
            horizontal: Simplify.widthClc(context, 4),
          ),
          margin:
              EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 2)),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(3)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                size: 13,
                color: Colors.black,
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
