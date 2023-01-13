import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import '../../../../helpers/AppLocalizations.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Email".tr(context),
      ),
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Subject".tr(context),
      ),
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Name".tr(context),
      ),
      const SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Message".tr(context),
        maxLines: 8,
      ),
      const SizedBox(
        height: 32,
      ),
      myButton(() {}, "Submit".tr(context).tr(context)),
    ]);
  }
}
