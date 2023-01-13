import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:flutter/material.dart';
import '../../../../../helpers/AppLocalizations.dart';

class AdPosted extends StatefulWidget {
  @override
  State<AdPosted> createState() => _AdPostedState();
}

class _AdPostedState extends State<AdPosted> {
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
                  const CircleAvatar(
                    backgroundColor: Color(0xff2E9216),
                    radius: 60,
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 8),
                    child: Center(
                      child: Text(
                        "Your Ad. is posted successfully".tr(context),
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
                        "Stay tuned for any inquiry about your property. we hope you good experience"
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
                    // myApplication.navigateTo(AppMain(), context);
                  }, "Done".tr(context)),
                ]),
          )),
    );
    ;
  }
}
