import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helpers/AppLocalizations.dart';

class ResetMail extends StatefulWidget {
  final String mail;
  const ResetMail({super.key, required this.mail});
  @override
  State<ResetMail> createState() => _ResetMailState();
}

class _ResetMailState extends State<ResetMail> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      scrollable: true,
      content: Padding(
          padding: const EdgeInsets.all(1),
          child: SizedBox(
            width: 300,
            height: 400,
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
                        "Recover mail successfully sent".tr(context),
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
                      child: Column(
                        children: [
                          Text(
                            "password recovery mail has been successfully sent to your email: "
                                .tr(context),
                            style: const TextStyle(
                                fontFamily: "Tajawal,Regular",
                                fontSize: 13,
                                color: Color(0xFF363A3D)),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.mail,
                            style: TextStyle(
                                fontFamily: "Tajawal,Regular",
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  myButton(() {
                    Navigator.pop(context);
                    myApplication.navigateTo(LogIn(), context);
                  }, "Done".tr(context)),
                ]),
          )),
    );
    ;
  }
}
