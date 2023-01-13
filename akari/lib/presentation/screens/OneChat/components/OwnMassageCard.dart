import 'package:flutter/material.dart';

class OwnMassageCard extends StatelessWidget {
  final String? msg;
  const OwnMassageCard({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
        child: Card(
          margin: const EdgeInsets.only(top: 20),
          color: const Color(0xffdcf8c6),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 50, top: 5, bottom: 20),
              child: Text(
                msg!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // Text(
                  //   "20:50",
                  //   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.done_all,
                    size: 20,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
