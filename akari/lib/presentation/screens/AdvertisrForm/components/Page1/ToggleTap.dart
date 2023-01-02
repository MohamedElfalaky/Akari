import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToggleTap extends StatelessWidget {
  final String valuee;
  final bool booll;
  ToggleTap(this.valuee, this.booll);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 32,
        // width: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color: booll
                ? Theme.of(context).colorScheme.secondary
                : Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            booll
                ? Text(
                    "−",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                : Text("+",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20)),
            SizedBox(
              width: 5,
            ),
            Text(
              valuee,
              style: TextStyle(
                  fontSize: 14,
                  // fontFamily: "Tajawal,Regular",
                  color: booll
                      ? Colors.white
                      : Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}
