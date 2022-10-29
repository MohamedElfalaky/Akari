import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Simplify.widthClc(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Welcome",
            style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
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
          SearchFilter()
        ],
      ),
    );
  }
}
