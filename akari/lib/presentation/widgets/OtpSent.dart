import 'package:akari/helpers/AppLocalizations.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpSent extends StatefulWidget {
  final String mail;
  const OtpSent(this.mail, {super.key});
  @override
  State<OtpSent> createState() => _OtpSentState();
}

class _OtpSentState extends State<OtpSent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            width: 300,
            height: 380,
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
                  SvgPicture.asset("assets/Enter OTP-bro.svg"),
                  Container(
                    margin: EdgeInsets.only(
                        top: myApplication.hightClc(context, 24),
                        bottom: myApplication.hightClc(context, 8)),
                    child: Center(
                      child: Text(
                        "OTP sent successflly".tr(context),
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: myApplication.hightClc(context, 16)),
                    child: Center(
                      child: Text(
                        "${'OTP has been successfully sent to your email:'.tr(context)} ${widget.mail}",
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
                  }, "Done".tr(context)),
                ]),
          )),
    );
    ;
  }
}
