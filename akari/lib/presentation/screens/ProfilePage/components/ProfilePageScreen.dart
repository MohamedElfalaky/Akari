import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen();

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  // ProfilePageController _ProfilePageController = ProfilePageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _ProfilePageController.ProfilePageAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      SizedBox(
        height: 24,
      ),
      Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                fit: BoxFit.fill),
          ),
        ),
      ),
      SizedBox(
        height: 24,
      ),
      Container(
        margin: EdgeInsets.only(
          left: 50,
          right: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ahmed mohamed",
              style: TextStyle(fontFamily: "Tajawal", fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  msgg,
                  height: 20,
                ),
                Text(
                  "ahmed@example.test",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  calll,
                  height: 20,
                ),
                Text(
                  "021153668498",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer, ReadMore",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontFamily: "Tajawal",
                fontSize: 13,
                wordSpacing: 1.5,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              child: myButton(() {}, "edit profile"),
              width: 138,
            )
          ],
        ),
      )
    ]);
  }
}
