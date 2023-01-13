import 'package:akari/data/cubits/ResendOtp/ResendOtpCubit.dart';
import 'package:akari/data/cubits/VarifyOtp/VarifyOtpCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/ResetPass.dart';
import 'package:akari/presentation/widgets/OtpSent.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/AppLocalizations.dart';
import 'package:sizer/sizer.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatelessWidget {
  String userMail;
  String fromWhere;
  OTP({super.key, required this.userMail, required this.fromWhere});
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: BlocListener<VarifyOtpCubit, VarifyOtpState>(
        listener: (context, state) {
          if (state is VarifyOtpSuccess) {
            if (fromWhere == "register") {
              myApplication.navigateToRemove(context, LogIn());
            } else if (fromWhere == "forget pass") {
              myApplication.navigateToRemove(
                  context,
                  ResetPass(
                    userMail: userMail,
                    token: state.myVarifyOtpModel.accessToken!,
                  ));
            }
          }
        },
        child: Scaffold(
          body: BlocListener<ResendOtpCubit, ResendOtpState>(
            listener: (context, state) {
              if (state is ResendOtpSuccess) {
                showDialog(
                  context: context,
                  builder: (BuildContext myContext) {
                    return OtpSent(userMail);
                  },
                );
              }
            },
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: myApplication.hightClc(context, 340),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                          child: Image.asset(
                            mainLogo,
                            height: 300,
                          ),
                        )),
                    Container(
                      height: myApplication.hightClc(context, 460),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: myApplication.widthClc(context, 24)),
                      decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                                offset: Offset(0, 2),
                                color: Color(0xFF66718514),
                                blurRadius: 4)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.sp),
                              topRight: Radius.circular(30.sp))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: myApplication.hightClc(context, 24),
                                bottom: myApplication.hightClc(context, 16)),
                            child: Center(
                              child: Text(
                                "Confirm Your Account".tr(context),
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    fontSize: 24,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          Container(
                            width: myApplication.widthClc(context, 272),
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 6)),
                            child: Center(
                              child: Text(
                                "Enter Confirmation Code that has been sent to your email:"
                                    .tr(context),
                                style: const TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 16,
                                    color: Color(0xFF363A3D)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 40)),
                            child: Center(
                              child: Text(
                                userMail,
                                style: TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Pinput(
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            onCompleted: (pin) => print(pin),
                            length: 5,
                            controller: pinController,
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 48),
                          ),

                          BlocBuilder<VarifyOtpCubit, VarifyOtpState>(
                            builder: (context, state) {
                              return state is! VarifyOtpLoading
                                  ? myButton(() {
                                      VarifyOtpCubit.get(context).userVarifyOtp(
                                          mail: userMail,
                                          otp: int.parse(pinController.text));
                                    }, "Confirm".tr(context))
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
                          ),
                          // Text(
                          //   "04:49",
                          //   style: TextStyle(
                          //       fontFamily: "Tajawal",
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 16),
                          // ),
                          SizedBox(
                            height: myApplication.hightClc(context, 26),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't receive any code!".tr(context),
                                style: const TextStyle(
                                  fontFamily: "Tajawal,Regular",
                                  color: Color(0XFF116A92),
                                  fontSize: 16,
                                ),
                              ),
                              BlocBuilder<ResendOtpCubit, ResendOtpState>(
                                builder: (context, state) {
                                  return state is! ResendOtpLoading
                                      ? InkWell(
                                          onTap: () {
                                            context
                                                .read<ResendOtpCubit>()
                                                .userResendOtp(mail: userMail);
                                          },
                                          child: const Text(" Resend",
                                              style: TextStyle(
                                                  fontFamily: "Tajawal",
                                                  color: Color(
                                                    0XFFDC8035,
                                                  ),
                                                  fontSize: 16)))
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
