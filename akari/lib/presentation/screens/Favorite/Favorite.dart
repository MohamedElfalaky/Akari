import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/Favorite/components/FavoriteAppBar.dart';
import 'package:akari/presentation/screens/Favorite/components/FavoriteScreen.dart';
import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class Favorite extends StatefulWidget {
  const Favorite();

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  // final FavoriteController _FavoriteControllerController = FavoriteController();

  @override
  void initState() {
    super.initState();

    // _FavoriteControllerController.FavoriteAPIs(
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
              "Favorite",
              style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
            ),
          ),
          body: Container(
              // height: MyApplication.hightClc(context, 700),  معدتش هتحتاجها الكونتينر بقى لعمل مارجن ف الاول بس لتخطيط الصفحة
              margin: EdgeInsets.only(left: 24, right: 24, top: 30),
              child: FavoriteScreen())),
    );
  }
}
