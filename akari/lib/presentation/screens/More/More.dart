import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/components/MoreScreen.dart';
import 'package:akari/presentation/screens/ProfilePage/ProfilePage.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            backgroundColor: Color(0xFFF4F4F4),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              toolbarHeight: 152,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hello, Ahmed Mohamed",
                        style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () =>
                              myApplication.navigateTo(ProfilePage(), context),
                          child: Container(
                            height: 32,
                            width: 32,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white24),
                            child: SvgPicture.asset(
                              penn,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // height: 95,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 38, vertical: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(calll),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Ahmed Mohamed",
                                  style: TextStyle(
                                      fontFamily: "Tajawal", fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(msgg),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "ahmed@example.test",
                                  style: TextStyle(
                                      fontFamily: "Tajawal", fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: MoreScreen()));
  }
}
