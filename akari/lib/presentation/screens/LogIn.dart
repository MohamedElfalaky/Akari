import 'package:akari/helpers/myApplication.dart';
import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/presentation/widgets/Shared/AlreadyHaveAccount.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final _formKey = GlobalKey<FormState>();
  final mailText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: myApplication.hightClc(context, 350),
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                            child: SvgPicture.asset("assets/LoginLogo.svg"))),
                    Container(
                      height: myApplication.hightClc(context, 440),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: myApplication.hightClc(context, 16),
                                bottom: myApplication.hightClc(context, 8)),
                            child: Center(
                              child: AutoSizeText(
                                "Login",
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
                                "Welcome to Smart Building!",
                                style: TextStyle(
                                    fontFamily: "Tajawal,Regular",
                                    fontSize: 13,
                                    color: Color(0xFF363A3D)),
                              ),
                            ),
                          ),
                          myTextField(
                            hint: "Email",
                            prefix: "assets/registerPics/vuesax-bulk-sms.svg",
                            // suffix: LoginCubit.get(context).securityIcon,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your mail";
                              } else if (value.isNotEmpty &&
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "Please use mail formoula email@email.com";
                              }
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 16),
                          ),

                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return myTextField(
                                obscureTxt:
                                    LoginCubit.get(context).isHiddenPass,
                                hint: "Password",
                                prefix:
                                    "assets/registerPics/vuesax-bulk-lock.svg",
                                suffix: InkWell(
                                    onTap: () =>
                                        LoginCubit.get(context).showPassWord(),
                                    child:
                                        LoginCubit.get(context).securityIcon),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter your Password";
                                  } else if (value.length <= 5) {
                                    return "Password must be more than 5 fileds";
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 8),
                          ),

                          InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, "/forgetpassword"),
                              child: AutoSizeText(
                                "Forget password ?",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Tajawal,Regular",
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              )),

                          //forgetpass

                          //zorar login//

                          SizedBox(
                            height: myApplication.hightClc(context, 32),
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return state is! LoginLoading
                                  ? myButton(() {
                                      if (_formKey.currentState!.validate()) {
                                        // context.read<LoginCubit>().userLogin(
                                        //     mail: mailText.text,
                                        //     password: passwordText.text);
                                      }
                                    }, "Log in")
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Don't have an account!",
                                style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0XFF116A92),
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/register");
                                    // Navigator.of(context).pushNamedAndRemoveUntil(
                                    //     "/register",
                                    //     (Route<dynamic> route) => false);
                                  },
                                  child: AutoSizeText("  sign up",
                                      style: TextStyle(
                                          fontFamily: "Tajawal",
                                          color: Color(
                                            0XFFDC8035,
                                          ),
                                          fontSize: 16)))
                            ],
                          ),
                          SizedBox(
                            height: myApplication.hightClc(context, 24),
                          ),
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
