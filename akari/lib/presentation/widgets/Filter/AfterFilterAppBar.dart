import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AfterFilterAppBar extends StatelessWidget {


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
              Text(
                "Result",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Tajawal,Medium",
                    color: Color(0xFF363A3D)),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/appmain", (route) => false),
                child: Icon(
                  Icons.close,
                  color: Color(0xFF363A3D),
                ),
              )
            ],
          ),
          SizedBox(
            height: myApplication.hightClc(context, 20),
          ),
          SearchFilter(() => Navigator.pushReplacement(
              //
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      AfterFilterAndSearch("Search relust"))))
        ],
      ),
    );
  }
}
