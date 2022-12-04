import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/global.dart';

class MarketProfile extends StatefulWidget {
  @override
  State<MarketProfile> createState() => _MarketProfileState();
}

class _MarketProfileState extends State<MarketProfile> {
  // final MarketProfileController _marketProfileControllerController =
  //     MarketProfileController();

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

        child: Scaffold(
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            //   centerTitle: true,
            //   backgroundColor: Theme.of(context).colorScheme.secondary,
            //   toolbarHeight: MyApplication.hightClc(context, 90),
            //   elevation: 0,
            //   title: MarketProfileAppBar(),
            // ),
            body: Container(
          height: 300,
          width: 300,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(30, 30), zoom: 11),
          ),
        )));
  }
}
