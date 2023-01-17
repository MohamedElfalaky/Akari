import 'package:flutter/material.dart';

class OneTAC extends StatelessWidget {
  final datee;
  final titlee;
  final bodyy;
  const OneTAC({super.key, this.datee, this.titlee, this.bodyy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          "last update at: ${datee}",
          style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(158, 28, 28, 48),
              fontFamily: "Tajawal"),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          titlee,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Tajawal"),
        ),
        SizedBox(
          height: 4,
        ),
        Text(bodyy,
            style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(158, 28, 28, 48),
                fontFamily: "Tajawal")),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
