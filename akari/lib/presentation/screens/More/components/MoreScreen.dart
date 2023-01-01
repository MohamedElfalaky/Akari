import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/ChangePassWord/ChangePassWord.dart';
import 'package:akari/presentation/screens/ContactUs/ContactUs.dart';
import 'package:akari/presentation/screens/More/components/MyAdsScreen.dart';
import 'package:akari/presentation/screens/ProfilePage/ProfilePage.dart';
import 'package:akari/presentation/screens/TAC/TAC.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen();

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  // MoreController _MoreController = MoreController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _MoreController.MoreAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),

            //////////////////// change password

            InkWell(
              onTap: () => myApplication.navigateTo(ChangePassWord(), context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(pass11),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Change password",
                      style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            ),

            //////////////////// My Adds
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(MyAdsScreen(), context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      myAddss,
                      height: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "My Ads.",
                          style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "(123)",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            ),

            //////////////////// Currancy

            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(0),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        height: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Choose currency",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RadioListTile(
                              title: Text("Sudanese pound (SD)"),
                              value: "value",
                              groupValue: "valuse",
                              onChanged: (value) {},
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            RadioListTile(
                              title: Text("Dollars (\$)"),
                              value: "value",
                              groupValue: "value",
                              onChanged: (value) {},
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            myButton(
                              () {},
                              "Apply Changes",
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Currency : ",
                          style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                        ),
                        Text("Sudanese pound (SD)",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(0),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        height: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Choose Language",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RadioListTile(
                              title: Text("English"),
                              value: "value",
                              groupValue: "valuse",
                              onChanged: (value) {},
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            RadioListTile(
                              title: Text("العربية"),
                              value: "value",
                              groupValue: "value",
                              onChanged: (value) {},
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            myButton(
                              () {},
                              "Apply Changes",
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(pass11),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Language : ",
                          style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                        ),
                        Text("English",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(ContactUs(), context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Contact us",
                      style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(TAC(), context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Terms and conditions",
                      style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(TAC(), context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Privacy policy",
                      style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 150,
            // ),
            // myButton(() {}, "Become an advertisor")
          ],
        ),
      )
    ]);
  }
}
