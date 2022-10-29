import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabBarItem extends StatelessWidget {
  final String name;
  final String svg;
  TabBarItem(this.name, this.svg);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(1),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
      ),
      onPressed: () {},
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Simplify.widthClc(context, 8),
              vertical: Simplify.hightClc(context, 8)),
          margin:
              EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 4)),
          height: Simplify.hightClc(context, 40),
          // width: Simplify.widthClc(context, 66),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(3)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(svg),
              SizedBox(
                width: Simplify.widthClc(context, 8),
              ),
              AutoSizeText(
                name,
                style: TextStyle(
                    fontSize: 14,
                    // fontFamily: "Tajawal",
                    color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
