import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';

class FilterTab extends StatelessWidget {
  final String valuee;
  final bool booll;
  const FilterTab(this.valuee, this.booll, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: myApplication.hightClc(context, 24),
        padding: EdgeInsets.symmetric(
          horizontal: myApplication.widthClc(context, 4),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: myApplication.widthClc(context, 2)),
        decoration: BoxDecoration(
            color: booll
                ? Color.fromARGB(255, 24, 18, 141)
                : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              booll ? Icons.minimize : Icons.add,
              size: 13,
              color: Colors.black,
            ),
            Text(
              valuee,
              style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Tajawal,Regular",
                  color: Color(0xFF363A3D)),
            )
          ],
        ),
      ),
    );
  }
}
