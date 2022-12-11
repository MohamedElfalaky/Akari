import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/ProfilePage/ProfilePage.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
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
      InkWell(
        onTap: () => myApplication.navigateTo(ProfilePage(), context),
        child: Container(
          height: 95,
          padding: EdgeInsets.symmetric(horizontal: 38, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
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
              Text(
                "Ahmed Mohamed",
                style: TextStyle(fontFamily: "Tajawal", fontSize: 20),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_sharp)
            ],
          ),
        ),
      ),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
            /////

            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  SvgPicture.asset(termss),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Currency : Sudanese pound (SD)",
                    style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_sharp)
                ],
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  SvgPicture.asset(pass11),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Language : English",
                    style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_sharp)
                ],
              ),
            ),
            //////////////////
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                  Spacer(),
                  Icon(Icons.arrow_forward_sharp)
                ],
              ),
            ),
            SizedBox(
              height: 174,
            ),
            myButton(() {}, "Become an advertisor")
          ],
        ),
      )
    ]);
  }
}
