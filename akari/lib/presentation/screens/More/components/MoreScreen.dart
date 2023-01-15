import 'package:akari/data/cubits/Local/local_cubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/ChangePassWord/ChangePassWord.dart';
import 'package:akari/presentation/screens/ContactUs/ContactUs.dart';
import 'package:akari/presentation/screens/More/components/MyAdsScreen.dart';
import 'package:akari/presentation/screens/TAC/TAC.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen();

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  // MoreController _MoreController = MoreController();
  String selectedLang = 'non';
  String _selectedCurrncy = 'USD';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _MoreController.MoreAPIs(context, CacheHelper.getFromShared("token"));
    LocalCubit.get(context).getSavedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),

            //////////////////// change password

            InkWell(
              onTap: () =>
                  myApplication.navigateTo(const ChangePassWord(), context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(pass11),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Change password".tr(context),
                      style:
                          const TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            ),

            //////////////////// My Adds

            CacheHelper.getFromShared("isAdvertiser") == "yes"
                ? Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () =>
                            myApplication.navigateTo(MyAdsScreen(), context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                adsTap,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "My Ads.",
                                    style: TextStyle(
                                        fontFamily: "Tajawal", fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "(6)",
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_sharp)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),

            //////////////////// Currancy

            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(0),
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
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Choose currency",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RadioListTile(
                              title: Text("Sudanese pound (SD)".tr(context)),
                              value: "SD",
                              groupValue: _selectedCurrncy,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCurrncy = value!;
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            RadioListTile(
                              title: Text("Dollars (\$)".tr(context)),
                              value: "USD",
                              groupValue: _selectedCurrncy,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCurrncy = value!;
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            myButton(
                              () {
                                Navigator.pop(context);
                              },
                              "Apply Changes".tr(context),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Currency : ".tr(context),
                          style: const TextStyle(
                              fontFamily: "Tajawal", fontSize: 16),
                        ),
                        Text("Sudanese pound (SD)".tr(context),
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(0),
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
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Choose Language".tr(context),
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            BlocListener<LocalCubit, LocalState>(
                              listener: (context, state) {
                                if (state is ChangeLocaleState) {
                                  if (state.local.languageCode == "en") {
                                    selectedLang = "English";
                                  } else {
                                    selectedLang = "العربية";
                                  }
                                }
                              },
                              child: Column(
                                children: [
                                  RadioListTile(
                                    title: const Text("English"),
                                    value: "English",
                                    groupValue:
                                        LocalCubit.get(context).selectedLang1,
                                    onChanged: (value) {
                                      LocalCubit.get(context).selectedLang1 =
                                          value!;
                                      String langCode = LocalCubit.get(context)
                                                  .selectedLang1 ==
                                              "English"
                                          ? 'en'
                                          : 'ar';
                                      LocalCubit.get(context)
                                          .changeLanguage(langCode);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selectedTileColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  RadioListTile(
                                    title: const Text("العربية"),
                                    value: "العربية",
                                    groupValue:
                                        LocalCubit.get(context).selectedLang1,
                                    onChanged: (value) {
                                      LocalCubit.get(context).selectedLang1 =
                                          value!;
                                      String langCode = LocalCubit.get(context)
                                                  .selectedLang1 ==
                                              "English"
                                          ? 'en'
                                          : 'ar';
                                      LocalCubit.get(context)
                                          .changeLanguage(langCode);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selectedTileColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            myButton(
                              () {
                                Navigator.pop(context);
                              },
                              "Apply Changes".tr(context),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(pass11),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Language : ".tr(context),
                          style: const TextStyle(
                              fontFamily: "Tajawal", fontSize: 16),
                        ),
                        Text(LocalCubit.get(context).selectedLang1,
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(const ContactUs(), context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Contact us".tr(context),
                      style:
                          const TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            ),
            //////////////////
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(const TAC(), context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Terms and conditions".tr(context),
                      style:
                          const TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            //////////////////
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(const TAC(), context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SvgPicture.asset(termss),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Privacy policy".tr(context),
                      style:
                          const TextStyle(fontFamily: "Tajawal", fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 150,
            // ),
            // myButton(() {}, "Become an advertisor")
          ],
        ),
      )
    ]);
  }
}
