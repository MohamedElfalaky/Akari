import 'package:akari/presentation/screens/ProfilePage/components/ProfilePageScreen.dart';

import 'package:flutter/material.dart';
import '../../../helpers/AppLocalizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
            backgroundColor: const Color(0xFFF4F4F4),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              toolbarHeight: 80,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Text(
                "ِEdit Profile".tr(context),
                style: const TextStyle(fontSize: 24, fontFamily: "Tajawal"),
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: const ProfilePageScreen()));
  }
}
