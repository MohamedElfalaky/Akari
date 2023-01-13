import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/Register.dart';
import 'package:akari/presentation/widgets/Shared/myOutLinedButton.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class SorryPopUp extends StatefulWidget {
  @override
  State<SorryPopUp> createState() => _SorryPopUpState();
}

class _SorryPopUpState extends State<SorryPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(1),
          child: SizedBox(
            width: 300,
            // height: 360,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close)),
                    ],
                  ),
                  SvgPicture.asset(sorryy),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 8),
                    child: Center(
                      child: Text(
                        "you aren't a user".tr(context),
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Center(
                      child: Text(
                        "Create account now and start using smart building"
                            .tr(context),
                        style: const TextStyle(
                            fontFamily: "Tajawal,Regular",
                            fontSize: 13,
                            color: Color(0xFF363A3D)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  myButton(() {
                    Navigator.pop(context);
                    myApplication.navigateTo(Register(), context);
                  }, "Create account".tr(context)),
                  const SizedBox(
                    height: 8,
                  ),
                  myOutLinedButton(
                    () {
                      Navigator.pop(context);
                      myApplication.navigateTo(LogIn(), context);
                    },
                    "Log in".tr(context),
                    txtClr: Theme.of(context).colorScheme.primary,
                  ),
                ]),
          )),
    );
    ;
  }
}
