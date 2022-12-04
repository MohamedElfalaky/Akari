import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/components/MoreScreen.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class More extends StatefulWidget {
  const More();

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  // final MoreController _MoreControllerController = MoreController();

  @override
  void initState() {
    super.initState();

    // _MoreControllerController.MoreAPIs(
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
            automaticallyImplyLeading: false,
            // centerTitle: true,
            toolbarHeight: 80,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16))),
            title: Text(
              "More",
              style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
            ),
          ),
          body: Container(
              // height: MyApplication.hightClc(context, 700),  معدتش هتحتاجها الكونتينر بقى لعمل مارجن ف الاول بس لتخطيط الصفحة
              margin: EdgeInsets.only(left: 24, right: 24, top: 30),
              child: MoreScreen())),
    );
  }
}
