import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/global.dart';

class OneChatAppBar extends StatelessWidget {
  const OneChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: myApplication.hightClc(context, 52),
            width: myApplication.widthClc(context, 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.5),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  size: 30, color: Colors.black.withOpacity(0.6)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(
            // width: 160,
            child: Text("OneChat ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.clip),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.5),
            ),
            height: myApplication.hightClc(context, 52),
            width: myApplication.widthClc(context, 48),
            padding: const EdgeInsets.all(6),
            child: InkWell(
              // onTap: () => myApplication.navigateTo(Home(), context),
              child: Icon(
                Icons.home,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
