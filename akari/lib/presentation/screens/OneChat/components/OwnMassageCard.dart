import 'package:flutter/material.dart';

class OwnMassageCard extends StatelessWidget {
  const OwnMassageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
        child: Card(
          margin: EdgeInsets.only(top: 20),
          color: Color(0xffdcf8c6),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 50, top: 5, bottom: 20),
              child: Text(
                "Hello Mohamed, how are you doing today?!",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Row(
                children: [
                  Text(
                    "20:50",
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
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
