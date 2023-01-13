import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import '../../../../helpers/AppLocalizations.dart';

class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen({super.key});

  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
  // ChangePassWordController _ChangePassWordController = ChangePassWordController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 24,
      ),
      myTextField(
        prefix: lockk,
        hint: "Current Password".tr(context),
      ),
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "New password".tr(context),
        prefix: lockk,
      ),
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Confirm password".tr(context),
        prefix: lockk,
      ),
      const Spacer(
        flex: 3,
      ),
      myButton(() {}, "Confirm".tr(context)),
      const Spacer(
        flex: 1,
      )
    ]);
  }
}
