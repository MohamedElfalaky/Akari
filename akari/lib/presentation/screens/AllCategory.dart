import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AppMain/controller/AppMainController.dart';
import 'package:akari/presentation/widgets/AllCategory/AllCategoryAppBar.dart';

import 'package:akari/presentation/screens/AppMain/components/TabBarItem.dart';

import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:flutter/material.dart';
import '../../../helpers/AppLocalizations.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  AppMainController appMainController = AppMainController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // remove back button in appbar.

          backgroundColor: Color(0xFFFFFFFF),
          toolbarHeight: myApplication.hightClc(context, 145),
          elevation: 0,
          title: AllCategoryAppBar(),
        ),
        body: Container(
            margin: EdgeInsets.only(
              left: myApplication.widthClc(context, 10),
              right: myApplication.widthClc(context, 10),
              top: myApplication.hightClc(context, 24),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: categoryDropDown
                  .map((e) => TabBarItem(
                      name: e["name"].toString().tr(context),
                      svg: e["img"],
                      onpressHandler: () {
                        appMainController.AppMainAPIs(
                            myContext: context, limit: 4);
                      }))
                  .toList(),
            )),
      ),
    );
  }
}
