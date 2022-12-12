import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  msgg,
                  height: 25,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ِEmail",
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.7),
                          fontSize: 12),
                    ),
                    Text(
                      "ahmed@example.test",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 138,
              height: 36,
              child: myButton(
                btnClr: Theme.of(context).colorScheme.secondary,
                () {
                  showModalBottomSheet(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
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
                                  "Change your email",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Enter new distinctive email and you will receive confirmation code for verification",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Tajawal", fontSize: 16),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              myTextField(
                                prefix: msgg,
                              ),
                              SizedBox(
                                height: 24,
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
                "Change email",
              ),
            ),
            SizedBox(
              height: 24,
            ),
            myTextField(
              prefix: usrr,
            ),
            SizedBox(
              height: 24,
            ),
            myTextField(
              prefix: calll,
            ),
            SizedBox(
              height: 24,
            ),
            myTextField(
              maxLines: 7,
              hint: "About you...",
            ),
            SizedBox(
              height: 32,
            ),
            myButton(() {}, "Save")
          ],
        ),
      )
    ]);
  }
}
