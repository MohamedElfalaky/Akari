import 'package:akari/data/Shared/Simplify.dart';
import 'package:akari/presentation/widgets/AppMain/AppMainScreen.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:flutter/material.dart';

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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: "chat"),
            BottomNavigationBarItem(icon: Icon(Icons.more), label: "more"),
          ],
        ),
      ),
    );
  }
}
