import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabBarItem extends StatelessWidget {
  final String? name;
  final String? svg;
  final bool? isSelected;
  final onpressHandler;
  const TabBarItem({this.name, this.svg, this.onpressHandler, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(1),
        elevation: 0,
        backgroundColor: isSelected == true
            ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
            : Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
      ),
      onPressed: onpressHandler,
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: myApplication.widthClc(context, 2),
              vertical: myApplication.hightClc(context, 2)),
          margin: EdgeInsets.symmetric(
              horizontal: myApplication.widthClc(context, 4)),
          height: myApplication.hightClc(context, 40),
          // width: myApplication.widthClc(context, 66),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(3)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(svg!),
              SizedBox(
                width: myApplication.widthClc(context, 8),
              ),
              AutoSizeText(
                name!,
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
