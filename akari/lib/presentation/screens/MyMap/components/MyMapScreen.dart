import 'dart:ffi';

import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/screens/MyMap/components/BestAdsItemInMap.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapScreen extends StatefulWidget {
  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: myApplication.hightClc(context, 900),
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 54, 212, 244),
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(15.650000, 32.483334), zoom: 11),
              markers: Set.from(
                [
                  Marker(
                    markerId: MarkerId("Source "),
                    position: LatLng(15.650000, 32.483334),
                  ),
                  Marker(
                    markerId: MarkerId("Source "),
                    position: LatLng(15.750000, 32.583334),
                  ),
                  Marker(
                    markerId: MarkerId("Source "),
                    position: LatLng(15.680000, 32.383334),
                  )
                ],
              )),
        ),
        Container(
          width: double.infinity,

          // color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.all(20),
          // height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SearchFilter(() => Navigator.push(
                      //
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              AfterFilterAndSearch("Search relust")))),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          top: myApplication.hightClc(context, 8)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            // scrollDirection: Axis.horizontal,
                            children: categoryTaps),
                      )),
                ],
              ),
              Container(
                height: 137,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    BestAdsItemInMap(),
                    BestAdsItemInMap(),
                    BestAdsItemInMap(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
