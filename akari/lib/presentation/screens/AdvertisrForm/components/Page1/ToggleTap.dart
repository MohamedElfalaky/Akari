import 'package:flutter/material.dart';

class ToggleTap extends StatelessWidget {
  final String valuee;
  final bool booll;
  const ToggleTap(this.valuee, this.booll, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 32,
        // width: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color: booll
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            booll
                ? const Text(
                    "−",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                : Text("+",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20)),
            const SizedBox(
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
