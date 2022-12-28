import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  final String? msg;
  const ReplyCard({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
        child: Card(
          margin: EdgeInsets.only(top: 20),
          // color: Color(0xffdcf8c6),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 50, top: 5, bottom: 20),
              child: Text(
                msg!,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Text(
                "20:50",
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
