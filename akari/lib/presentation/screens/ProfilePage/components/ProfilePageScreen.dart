import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/data/cubits/UpdateAll/UpdateAllCubit.dart';
import 'package:akari/data/cubits/UpdateUserMail/UpdateUserMailCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen();

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  TextEditingController mailController =
      TextEditingController(text: CacheHelper.getFromShared("email"));
  TextEditingController phoneController =
      TextEditingController(text: CacheHelper.getFromShared("phone"));
  // TextEditingController aboutController =
  //     TextEditingController(text: CacheHelper.getFromShared("email"));
  TextEditingController nameController =
      TextEditingController(text: CacheHelper.getFromShared("name"));
  TextEditingController aboutController =
      TextEditingController(text: CacheHelper.getFromShared("about"));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetUserDataCubit.get(context).userGetUserData(
        userId: CacheHelper.getFromShared("id"),
        token: CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        return state is GetUserDataSuccess
            ? ListView(shrinkWrap: true, children: [
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: NetworkImage(noImg), fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.myGetUserDataModel.data!.name!,
                        style: const TextStyle(
                            fontFamily: "Tajawal", fontSize: 24),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            msgg,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ِEmail".tr(context),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.7),
                                    fontSize: 12),
                              ),
                              Text(
                                state.myGetUserDataModel.data!.email!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 138,
                        height: 36,
                        child: myButton(
                          btnClr: Theme.of(context).colorScheme.secondary,
                          () {
                            showModalBottomSheet(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 40),
                                    height: 280,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Change your email".tr(context),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Enter new distinctive email and you will receive confirmation code for verification"
                                              .tr(context),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Tajawal",
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        myTextField(
                                          prefix: msgg,
                                          controller: mailController,
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        myButton(
                                          () {
                                            UpdateUserMailCubit.get(context)
                                                .userUpdateUserMail(
                                                    context: context,
                                                    newMail:
                                                        mailController.text,
                                                    token: CacheHelper
                                                        .getFromShared(
                                                            "token"));
                                          },
                                          "Apply Changes".tr(context),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          "Change email".tr(context),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      myTextField(
                        prefix: usrr,
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      myTextField(
                        prefix: calll,
                        controller: phoneController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      myTextField(
                        maxLines: 7,
                        hint: "About you...".tr(context),
                        controller: aboutController,
                        // controller: aboutController,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocBuilder<updateAllCubit, updateAllState>(
                        builder: (context, state) {
                          return state is updateAllLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : myButton(() {
                                  updateAllCubit.get(context).userupdateAll(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      about: aboutController.text,
                                      token: CacheHelper.getFromShared("token"),
                                      context: context);
                                }, "Save".tr(context));
                        },
                      )
                    ],
                  ),
                )
              ])
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
