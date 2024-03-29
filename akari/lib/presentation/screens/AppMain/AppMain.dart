import 'package:akari/data/Repositries/GetFavoritesRepo.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/BecomeAdvertisorPopUp.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/FormPage1.dart';
import '../../../helpers/AppLocalizations.dart';
import 'package:akari/presentation/screens/Chat/Chat.dart';
import 'package:akari/presentation/screens/Favorite/Favorite.dart';
import 'package:akari/presentation/screens/More/More.dart';
import 'package:akari/presentation/screens/AppMain/components/AppMainScreen.dart';

import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

GetFavoritesRepo getFavoritesRepo = GetFavoritesRepo();
int currentIndex = 0;
final screens = [
  const AppMainScreen(),
  const Favorite(),
  const Chat(),
  const More()
];

class _AppMainState extends State<AppMain> {
  @override
  void initState() {
    super.initState();
    chechAuth();
  }

  chechAuth() async {
    var auth =
        await getFavoritesRepo.getFavorites(CacheHelper.getFromShared("token"));
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
          //body
          body: IndexedStack(index: currentIndex, children: screens),
          //floating action button
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            heroTag: "btn1",
            child: const Icon(Icons.add),
            onPressed: () {
              CacheHelper.getFromShared("token") == null
                  ? showDialog(
                      context: context,
                      builder: (BuildContext myContext) {
                        return SorryPopUp();
                      },
                    )
                  : CacheHelper.getFromShared("isAdvertiser") != "yes"
                      ? showDialog(
                          context: context,
                          builder: (BuildContext myContext) {
                            return const BecomeAdvertisorPopUp();
                          },
                        )
                      : myApplication.navigateTo(FormPage1(), context);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //bottom nav bar

          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias, // تصميم مكان الفاب
            notchMargin: 6, // نوتش للفاب
            child: BottomNavigationBar(
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              // showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              currentIndex: currentIndex,
              onTap: (index) {
                chechAuth();

                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                        "assets/BottomActive/home-hashtag-bold.svg"),
                    icon: SvgPicture.asset("assets/bottomNav/home-hashtag.svg"),
                    label: "home".tr(context)),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(heartBulk),
                    icon: SvgPicture.asset("assets/bottomNav/heart.svg"),
                    label: "favorite".tr(context)),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(messageBulk),
                    icon: SvgPicture.asset("assets/bottomNav/message-text.svg"),
                    label: "chat".tr(context)),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(categoryBulk),
                    icon: SvgPicture.asset("assets/bottomNav/category.svg"),
                    label: "more".tr(context)),
              ],
            ),
          )),
    );
  }
}
