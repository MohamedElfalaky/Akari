import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';

import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen();

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  // ContactUsController _ContactUsController = ContactUsController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _ContactUsController.ContactUsAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Email",
      ),
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Subject",
      ),
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Name",
      ),
      SizedBox(
        height: 24,
      ),
      myTextField(
        hint: "Message",
        maxLines: 8,
      ),
      SizedBox(
        height: 32,
      ),
      myButton(() {}, "Submit"),
    ]);
  }
}
