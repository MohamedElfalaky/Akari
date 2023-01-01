import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/TAC/components/TACScreen.dart';

import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class TAC extends StatefulWidget {
  const TAC();

  @override
  State<TAC> createState() => _TACState();
}

class _TACState extends State<TAC> {
  // final TACController _TACControllerController = TACController();

  @override
  void initState() {
    super.initState();

    // _TACControllerController.TACAPIs(
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

      child: Scaffold(
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
            automaticallyImplyLeading: false,
            // centerTitle: true,
            toolbarHeight: 80,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16))),
            title: const Text(
              "Terms and conditions",
              style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
            ),
          ),
          body: Container(
              // height: MyApplication.hightClc(context, 700),  معدتش هتحتاجها الكونتينر بقى لعمل مارجن ف الاول بس لتخطيط الصفحة
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: TACScreen())),
    );
  }
}
