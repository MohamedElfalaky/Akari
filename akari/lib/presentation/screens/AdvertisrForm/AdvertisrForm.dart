import 'package:akari/presentation/screens/AdvertisrForm/components/FormPage1.dart';
import 'package:akari/presentation/screens/Favorite/components/FavoriteScreen.dart';

import 'package:flutter/material.dart';

class AdvertisrForm extends StatefulWidget {
  const AdvertisrForm();

  @override
  State<AdvertisrForm> createState() => _AdvertisrFormState();
}

class _AdvertisrFormState extends State<AdvertisrForm> {
  // final AdvertisrFormController _AdvertisrFormControllerController = AdvertisrFormController();

  @override
  void initState() {
    super.initState();

    // _AdvertisrFormControllerController.AdvertisrFormAPIs(
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

        child: FormPage1());
  }
}
