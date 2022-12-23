import 'package:akari/data/cubits/Registration/RegistrationCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/OTP.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController mailText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController passWordText = TextEditingController();
  TextEditingController rePassWordText = TextEditingController();

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
        body: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationSuccess) {
              print(state.myRegistrationModel.data!.email!);
              myApplication.navigateTo(
                  OTP(
                    userMail: state.myRegistrationModel.data!.email!,
                  ),
                  context);
            }
          },
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: myApplication.hightClc(context, 22),
                        ),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                            child: SvgPicture.asset("assets/logoRege.svg"))),
                    Container(
                      height: myApplication.hightClc(context, 672),
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: myApplication.hightClc(context, 16),
                                bottom: myApplication.hightClc(context, 8)),
                            child: AutoSizeText(
                              "Create Account",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 24,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 24)),
                            child: AutoSizeText(
                              "Be part of Aqari Now !",
                              style: TextStyle(
                                  fontFamily: "Tajawal,Regular",
                                  fontSize: 13,
                                  color: Color(0xFF363A3D)),
                            ),
                          ),
                          myTextField(
                            hint: "Email",
                            prefix: "assets/registerPics/vuesax-bulk-sms.svg",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your mail";
                              } else if (value.isNotEmpty &&
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "Please use mail formoula email@email.com";
                              }
                              return null;
                            },
                            controller: mailText,
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
                          ),
                          myTextField(
                            hint: "Name",
                            prefix: "assets/registerPics/user-bulk.svg",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your Name";
                              } else if (value.isNotEmpty &&
                                  value.length <= 5) {
                                return "Name must be more then 5 characters ";
                              }
                              return null;
                            },
                            controller: nameText,
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
                          ),
                          myTextField(
                            hint: "Mobile",
                            prefix: "assets/registerPics/call-bulk.svg",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your phone number";
                              } else if (value.isNotEmpty &&
                                  !RegExp(r'(^(?:[+0]9)?[0-9]{11}$)')
                                      .hasMatch(value)) {
                                return "Invalide mobile number";
                              }
                              return null;
                            },
                            keyBoardType: TextInputType.number,
                            controller: phoneText,
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
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
                                    controller: passWordText,
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
                                      } else if (value != passWordText.text) {
                                        return "Passwords are not matching";
                                      }
                                      return null;
                                    },
                                    controller: rePassWordText,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 32),
                          ),
                          BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                              return state is! RegistrationLoading
                                  ? myButton(() {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<RegistrationCubit>()
                                            .userRegistration(
                                                name: nameText.text,
                                                mail: mailText.text,
                                                password: passWordText.text,
                                                phone: phoneText.text);
                                      }
                                    }, "Create Account")
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 24),
                          ),
                          AlreadyHaveAccount(() =>
                              Navigator.pushReplacementNamed(
                                  context, "/login")),
                          SizedBox(
                            height: myApplication.hightClc(context, 24),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "By creating account you accept Smart Building",
                                style: TextStyle(
                                  fontFamily: "Tajawal,Regular",
                                  color: Color(0XFF363A3D),
                                  fontSize: 14,
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: AutoSizeText("Terms and conditions",
                                      style: TextStyle(
                                          fontFamily: "Tajawal",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 14)))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
