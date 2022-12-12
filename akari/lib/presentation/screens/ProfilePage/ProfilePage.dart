import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/ProfilePage/components/ProfilePageScreen.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final ProfilePageController _ProfilePageControllerController = ProfilePageController();

  @override
  void initState() {
    super.initState();

    // _ProfilePageControllerController.ProfilePageAPIs(
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
            backgroundColor: Color(0xFFF4F4F4),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              toolbarHeight: 80,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Text(
                "ِEdit Profile",
                style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: ProfilePageScreen()));
  }
}
