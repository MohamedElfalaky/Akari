import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AppMain/AppMainScreen.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

int currentIndex = 0;
final screens = [
  AppMainScreen(),
  Center(
    child: Text("S2"),
  ),
  Center(
    child: Text("S3"),
  ),
  Center(
    child: Text("S4"),
  ),
];

class _AppMainState extends State<AppMain> {
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
          toolbarHeight: Simplify.hightClc(context, 181),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          title: myAppBar(),
        ),
        body: IndexedStack(index: currentIndex, children: screens),
        floatingActionButton: ViewOnMap(),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                    "assets/BottomActive/home-hashtag-bold.svg"),
                icon: SvgPicture.asset("assets/bottomNav/home-hashtag.svg"),
                label: "home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottomNav/heart.svg"),
                label: "favorite"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottomNav/message-text.svg"),
                label: "chat"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottomNav/category.svg"),
                label: "more"),
          ],
        ),
      ),
    );
  }
}
