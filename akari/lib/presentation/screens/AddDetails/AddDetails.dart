import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/AddDetailsAppBar.dart';
import 'package:akari/presentation/screens/AddDetails/components/AddDetailsScreen.dart';
import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class AddDetails extends StatefulWidget {
  const AddDetails();

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

            body: AddDetailsScreen()),
      ),
    );
  }
}
