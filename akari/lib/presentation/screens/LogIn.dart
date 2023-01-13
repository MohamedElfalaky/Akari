import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../helpers/AppLocalizations.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final _formKey = GlobalKey<FormState>();
  final mailText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CacheHelper.saveToShared("id", state.myLoginModel.data!.id!);
          CacheHelper.saveToShared("email", state.myLoginModel.data!.email!);
          CacheHelper.saveToShared("name", state.myLoginModel.data!.name!);
          CacheHelper.saveToShared("phone", state.myLoginModel.data!.phone!);
          CacheHelper.saveToShared("token", state.myLoginModel.accessToken!);
          // CacheHelper.saveStringListToShared(
          //     "roles", state.myLoginModel.data!.roles as List<String>);

          state.myLoginModel.data!.roles!
                  .where((element) => element == "advertiser")
                  .isNotEmpty
              ? CacheHelper.saveToShared("isAdvertiser", "yes")
              : CacheHelper.saveToShared("isAdvertiser", "no");
          myApplication.navigateToRemove(context, const AppMain());
        }
      },
      child: GestureDetector(
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
                              child: Image.asset(
                            mainLogo,
                            height: 250,
                          ))),
                      Container(
                        height: myApplication.hightClc(context, 440),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: myApplication.hightClc(context, 16),
                                  bottom: myApplication.hightClc(context, 8)),
                              child: Center(
                                child: Text(
                                  "Login".tr(context),
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      fontSize: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: myApplication.hightClc(context, 24)),
                              child: Center(
                                child: Text(
                                  "Welcome to Smart Building!".tr(context),
                                  style: const TextStyle(
                                      fontFamily: "Tajawal,Regular",
                                      fontSize: 13,
                                      color: Color(0xFF363A3D)),
                                ),
                              ),
                            ),
                            myTextField(
                              controller: mailText,
                              hint: "Email".tr(context),
                              prefix: "assets/registerPics/vuesax-bulk-sms.svg",
                              // suffix: LoginCubit.get(context).securityIcon,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your mail".tr(context);
                                } else if (value.isNotEmpty &&
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return "Please use mail formoula email@email.com"
                                      .tr(context);
                                }
                              },
                            ),
                            SizedBox(
                              height: myApplication.hightClc(context, 16),
                            ),

                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return myTextField(
                                  controller: passwordText,
                                  obscureTxt:
                                      LoginCubit.get(context).isHiddenPass,
                                  hint: "Password".tr(context),
                                  prefix:
                                      "assets/registerPics/vuesax-bulk-lock.svg",
                                  suffix: InkWell(
                                      onTap: () => LoginCubit.get(context)
                                          .showPassWord(),
                                      child:
                                          LoginCubit.get(context).securityIcon),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter your Password"
                                          .tr(context);
                                    } else if (value.length <= 5) {
                                      return "Password must be more than 5 fileds"
                                          .tr(context);
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
                                child: Text(
                                  "Forget password ?".tr(context),
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
                                          context.read<LoginCubit>().userLogin(
                                              mail: mailText.text,
                                              password: passwordText.text);
                                        }
                                      }, "Log in".tr(context))
                                    : const Center(
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
                                Text(
                                  "Don't have an account!".tr(context),
                                  style: const TextStyle(
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
                                    child: Text("  sign up".tr(context),
                                        style: const TextStyle(
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
      ),
    );
  }
}
