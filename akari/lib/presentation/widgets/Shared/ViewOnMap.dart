import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/MyMap/MyMap.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ViewOnMap extends StatelessWidget {
  const ViewOnMap({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        myApplication.navigateTo(MyMap(), context);
      },
      mouseCursor: SystemMouseCursors.click,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: const AutoSizeText(
        'View on Map',
        style: TextStyle(fontSize: 14, fontFamily: "Tajawal,Regular"),
      ),
      icon: const Icon(Icons.map),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
