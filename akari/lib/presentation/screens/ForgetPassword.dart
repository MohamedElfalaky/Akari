import 'package:akari/data/cubits/VarifyOtp%20copy/ForgetPassCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/Filter.dart';
import 'package:akari/presentation/widgets/ForgetPassword/ResetMail.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();

  final _mailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: Scaffold(
        body: BlocListener<ForgetPassCubit, ForgetPassState>(
          listener: (context, state) {
            if (state is ForgetPassSuccess) {
              showDialog(
                context: context,
                builder: (BuildContext myContext) {
                  return ResetMail(mail: _mailText.text);
                },
              );
            }
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: myApplication.hightClc(context, 90),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                            child: SvgPicture.asset(
                                "assets/forgetpass/logo.svg"))),
                    Container(
                        height: myApplication.hightClc(context, 300),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                            child: SvgPicture.asset(
                                "assets/forgetpass/Forgot password-cuate.svg"))),
                    Container(
                      height: myApplication.hightClc(context, 400),
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
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: myApplication.hightClc(context, 24),
                                bottom: myApplication.hightClc(context, 8)),
                            child: Center(
                              child: AutoSizeText(
                                "Oops! Forgot Password?",
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    fontSize: 24,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 24)),
                            child: Center(
                              child: AutoSizeText(
                                "Don't Worry, we will help you recover your password simply and quickly.",
                                style: TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 13,
                                    color: Color(0xFF363A3D)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 16)),
                            child: Center(
                              child: AutoSizeText(
                                "Please enter your email to recover",
                                style: TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 13,
                                    color: Color(0xFF363A3D)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          myTextField(
                            controller: _mailText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your mail";
                              } else if (value.isNotEmpty &&
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "Please use mail formoula email@email.com";
                              }
                            },
                            hint: "Email",
                            prefix: "assets/registerPics/vuesax-bulk-sms.svg",
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 32),
                          ),

                          //forgetpass

                          //zorar login//

                          BlocBuilder<ForgetPassCubit, ForgetPassState>(
                            builder: (context, state) {
                              return state is! ForgetPassLoading
                                  ? myButton(() {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ForgetPassCubit>()
                                            .userForgetPass(
                                                mail: _mailText.text);
                                      }
                                    }, "Recover password")
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
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
