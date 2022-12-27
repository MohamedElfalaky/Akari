import 'package:akari/data/cubits/Registration/RegistrationCubit.dart';
import 'package:akari/data/cubits/ResendOtp/ResendOtpCubit.dart';
import 'package:akari/data/cubits/ResetPass/ResetPassCubit.dart';
import 'package:akari/data/cubits/VarifyOtp/VarifyOtpCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/widgets/OtpSent.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:pinput/pinput.dart';

class ResetPass extends StatelessWidget {
  String userMail;
  String token;
  ResetPass({super.key, required this.userMail, required this.token});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _passWordText = TextEditingController();
  TextEditingController _rePassWordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: BlocListener<ResetPassCubit, ResetPassState>(
        listener: (context, state) {
          if (state is ResetPassSuccess) {
            myApplication.navigateToRemove(context, LogIn());
          }
        },
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: myApplication.hightClc(context, 340),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/logo1.svg",
                        ))),
                    Container(
                      height: myApplication.hightClc(context, 460),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: myApplication.widthClc(context, 24)),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
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
                                "Reset your Password",
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
                                "Enter your new password and confirm it, the two passwords must be the same",
                                style: TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 16,
                                    color: Color(0xFF363A3D)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  myTextField(
                                    obscureTxt: RegistrationCubit.get(context)
                                        .isHiddenPass1,
                                    hint: "Password",
                                    prefix:
                                        "assets/registerPics/vuesax-bulk-lock.svg",
                                    suffix: InkWell(
                                        onTap: () =>
                                            RegistrationCubit.get(context)
                                                .showPassWord1(),
                                        child: RegistrationCubit.get(context)
                                            .securityIcon1),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter your Password";
                                      } else if (value.length <= 7) {
                                        return "Password must be more than 7 fileds";
                                      }
                                      return null;
                                    },
                                    controller: _passWordText,
                                  ),
                                  SizedBox(
                                    height: myApplication.hightClc(context, 16),
                                  ),
                                  myTextField(
                                    obscureTxt: RegistrationCubit.get(context)
                                        .isHiddenPass2,
                                    hint: "Confirm Password",
                                    prefix:
                                        "assets/registerPics/vuesax-bulk-lock.svg",
                                    suffix: InkWell(
                                        onTap: () =>
                                            RegistrationCubit.get(context)
                                                .showPassWord2(),
                                        child: RegistrationCubit.get(context)
                                            .securityIcon2),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please re-enter your Password";
                                      } else if (value != _passWordText.text) {
                                        return "Passwords are not matching";
                                      }
                                      return null;
                                    },
                                    controller: _rePassWordText,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<ResetPassCubit, ResetPassState>(
                            builder: (context, state) {
                              return state is! ResetPassLoading
                                  ? myButton(() {
                                      print(token);
                                      print(_passWordText.text);
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ResetPassCubit>()
                                            .userResetPass(
                                                password: _passWordText.text,
                                                token: token);
                                      }
                                    }, "Reset password")
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
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