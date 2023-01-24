import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/components/MoreScreen.dart';
import 'package:akari/presentation/screens/ProfilePage/ProfilePage.dart';

import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/AppLocalizations.dart';

class More extends StatefulWidget {
  const More();

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool isReadMore = false;
  @override
  void initState() {
    super.initState();

    CacheHelper.getFromShared("token") != null
        ? GetUserDataCubit.get(context).userGetUserData(
            userId: CacheHelper.getFromShared("id"),
            token: CacheHelper.getFromShared("token"))
        : null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        if (state is GetUserDataSuccess) {
          CacheHelper.saveToShared(
              "id", state.myGetUserDataModel.data!.id ?? "");
          CacheHelper.saveToShared(
              "email", state.myGetUserDataModel.data!.email ?? "");
          CacheHelper.saveToShared(
              "name", state.myGetUserDataModel.data!.name ?? "");
          CacheHelper.saveToShared(
              "phone", state.myGetUserDataModel.data!.phone ?? "");
          CacheHelper.saveToShared(
              "about", state.myGetUserDataModel.data!.about ?? "");
        }
      },
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          }, // hide keyboard on tap anywhere

          child: Scaffold(
              backgroundColor: const Color(0xFFF4F4F4),
              appBar: CacheHelper.getFromShared("token") == null
                  ? AppBar(
                      automaticallyImplyLeading: false,
                      // centerTitle: true,
                      toolbarHeight: 90,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16))),
                      title: Text(
                        "More".tr(context),
                        style: TextStyle(fontSize: 24, fontFamily: "Tajawal"),
                      ),
                    )
                  : AppBar(
                      automaticallyImplyLeading: false,
                      // centerTitle: true,
                      toolbarHeight: 190,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16))),
                      title: BlocBuilder<GetUserDataCubit, GetUserDataState>(
                        builder: (context, state) {
                          return state is GetUserDataSuccess
                              ? Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${'Hello'.tr(context)}, ${state.myGetUserDataModel.data!.name}",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: "Tajawal"),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                            onTap: () =>
                                                myApplication.navigateTo(
                                                    const ProfilePage(),
                                                    context),
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              padding: const EdgeInsets.all(7),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.white24),
                                              child: SvgPicture.asset(
                                                penn,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      // height: 95,
                                      // padding:
                                      //     EdgeInsets.symmetric(horizontal: 38, vertical: 5),
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(20))),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            height: 56,
                                            width: 56,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                  image: NetworkImage(noImg),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(calll),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    state.myGetUserDataModel
                                                            .data!.phone ??
                                                        "",
                                                    style: TextStyle(
                                                        fontFamily: "Tajawal",
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(msgg),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    state.myGetUserDataModel
                                                            .data!.email ??
                                                        "",
                                                    style: TextStyle(
                                                        fontFamily: "Tajawal",
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: 350,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Text(
                                            state.myGetUserDataModel.data!
                                                    .about ??
                                                "",
                                            maxLines: isReadMore ? 5 : 2,
                                            style: TextStyle(
                                                fontFamily: "Tajawal",
                                                fontSize: 16),
                                          ),
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  // minimumSize: Size(50, 30),
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  alignment:
                                                      Alignment.centerRight),
                                              onPressed: () {
                                                setState(() {
                                                  isReadMore = !isReadMore;
                                                });
                                              },
                                              child: Text(
                                                  isReadMore
                                                      ? "Read less".tr(context)
                                                      : "Read more".tr(context),
                                                  style: TextStyle(
                                                      fontFamily: "Tajawal",
                                                      fontSize: 14,
                                                      color: Colors.black)))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                        },
                      ),
                    ),
              body: CacheHelper.getFromShared("token") == null
                  ? Center(
                      child: Text("Please log in to access your personal data"
                          .tr(context)),
                    )
                  : const MoreScreen())),
    );
  }
}
