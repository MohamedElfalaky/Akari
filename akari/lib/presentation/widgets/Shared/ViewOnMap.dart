import 'package:akari/helpers/AppLocalizations.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/MyMap/MyMap.dart';
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
      label: Text(
        'View on Map'.tr(context),
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 14, fontFamily: "Tajawal,Regular"),
      ),
      icon: const Icon(Icons.map),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
