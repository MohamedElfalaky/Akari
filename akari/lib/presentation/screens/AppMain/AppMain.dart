import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AppMain/controller/AppMainController.dart';
import 'package:akari/presentation/screens/Chat/Chat.dart';
import 'package:akari/presentation/screens/Favorite/Favorite.dart';
import 'package:akari/presentation/screens/More/More.dart';
import 'package:akari/presentation/screens/AppMain/components/AppMainScreen.dart';

import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

int currentIndex = 0;
final screens = [AppMainScreen(), Favorite(), Chat(), More()];

class _AppMainState extends State<AppMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        body: IndexedStack(index: currentIndex, children: screens),
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
                activeIcon: SvgPicture.asset(heartBulk),
                icon: SvgPicture.asset("assets/bottomNav/heart.svg"),
                label: "favorite"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(messageBulk),
                icon: SvgPicture.asset("assets/bottomNav/message-text.svg"),
                label: "chat"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(categoryBulk),
                icon: SvgPicture.asset("assets/bottomNav/category.svg"),
                label: "more"),
          ],
        ),
      ),
    );
  }
}
