import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';

import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen();

  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
  // ChangePassWordController _ChangePassWordController = ChangePassWordController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _ChangePassWordController.ChangePassWordAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 24,
      ),
      myTextField(
        prefix: lockk,
        hint: " Current Password",
      ),
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "New password",
        prefix: lockk,
      ),
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Confirm password",
        prefix: lockk,
      ),
      Spacer(
        flex: 3,
      ),
      myButton(() {}, "Confirm"),
      Spacer(
        flex: 1,
      )
    ]);
  }
}
