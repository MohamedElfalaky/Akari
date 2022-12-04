import 'package:akari/presentation/screens/MyMap/components/MyMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/global.dart';

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  // final MyMapController _MyMapControllerController =
  //     MyMapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        }, // hide keyboard on tap anywhere

        child: Scaffold(body: MyMapScreen()));
  }
}
