import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class BecomeAdvertisorPopUp extends StatefulWidget {
  const BecomeAdvertisorPopUp({super.key});

  @override
  State<BecomeAdvertisorPopUp> createState() => _BecomeAdvertisorPopUpState();
}

class _BecomeAdvertisorPopUpState extends State<BecomeAdvertisorPopUp> {
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
            height: 360,
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
                  SvgPicture.asset(becomeAdvertisor),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 8),
                    child: Center(
                      child: Text(
                        "You must have Advertiser Account".tr(context),
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
                        "You must apply to become an advertiser so, you can continue adding new Ads."
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
                    // myApplication.navigateTo(Register(), context);
                  }, "Become an Advertiser".tr(context)),
                ]),
          )),
    );
    ;
  }
}
