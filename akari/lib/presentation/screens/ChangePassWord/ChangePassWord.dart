import 'package:akari/presentation/screens/ChangePassWord/components/ChangePassWordScreen.dart';
import '../../../helpers/AppLocalizations.dart';

import 'package:flutter/material.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord();

  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  // final ChangePassWordController _ChangePassWordControllerController = ChangePassWordController();

  @override
  void initState() {
    super.initState();

    // _ChangePassWordControllerController.ChangePassWordAPIs(
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
            title: Text(
              "Change password".tr(context),
              style: const TextStyle(fontSize: 24, fontFamily: "Tajawal"),
            ),
          ),
          body: Container(
              // height: MyApplication.hightClc(context, 700),  معدتش هتحتاجها الكونتينر بقى لعمل مارجن ف الاول بس لتخطيط الصفحة
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: const ChangePassWordScreen())),
    );
  }
}
