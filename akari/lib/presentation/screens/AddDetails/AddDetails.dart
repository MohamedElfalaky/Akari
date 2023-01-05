import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/AddDetailsAppBar.dart';
import 'package:akari/presentation/screens/AddDetails/components/AddDetailsScreen.dart';
import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class AddDetails extends StatefulWidget {
  final String? contractType;
  final String? buildingType;
  final String? deliveryTerm;
  final String? address;
  final String? createdAt;
  final String? description;
  final String? area;
  final String? floor;
  final String? bedRooms;
  final String? bathRooms;
  final List<dynamic>? amenities;
  final String? priceSd;
  final String? priceDollar;
  final String? phone;
  final String? advertiserId;
  final String? adId;
  final bool? isFavorite;
  const AddDetails(
      {super.key,
      this.contractType,
      this.buildingType,
      this.deliveryTerm,
      this.address,
      this.createdAt,
      this.description,
      this.area,
      this.floor,
      this.bedRooms,
      this.bathRooms,
      this.amenities,
      this.priceSd,
      this.priceDollar,
      this.phone,
      this.advertiserId,
      this.adId,
      this.isFavorite});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  // final AddDetailsController _AddDetailsControllerController = AddDetailsController();

  @override
  void initState() {
    super.initState();

    // _AddDetailsControllerController.AddDetailsAPIs(
    //     context, CacheHelper.getFromShared("token"));
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

      child: SafeArea(
        child: Scaffold(
            // backgroundColor: Theme.of(context).colorScheme.secondary,

            body: AddDetailsScreen(
                contractType: widget.contractType,
                buildingType: widget.buildingType,
                deliveryTerm: widget.deliveryTerm,
                address: widget.address,
                createdAt: widget.createdAt,
                description: widget.description,
                area: widget.area,
                floor: widget.floor,
                bedRooms: widget.bedRooms,
                bathRooms: widget.bathRooms,
                amenities: widget.amenities,
                priceSd: widget.priceSd,
                priceDollar: widget.priceDollar,
                phone: widget.phone,
                advertiserId: widget.advertiserId,
                isFavorite: widget.isFavorite,
                adId: widget.adId)),
      ),
    );
  }
}
