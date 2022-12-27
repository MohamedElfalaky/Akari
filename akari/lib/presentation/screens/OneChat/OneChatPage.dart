import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/OneChat/components/OneChatScreen.dart';

import 'package:akari/presentation/widgets/AppMain/myAppBar.dart';

import 'package:flutter/material.dart';

import '../../../app/global.dart';

class OneChatPage extends StatefulWidget {
  const OneChatPage();

  @override
  State<OneChatPage> createState() => _OneChatPageState();
}

class _OneChatPageState extends State<OneChatPage> {
  // final OneChatPageController _OneChatPageControllerController = OneChatPageController();

  @override
  void initState() {
    super.initState();

    // _OneChatPageControllerController.OneChatPageAPIs(
    //     context, CacheHelper.getFromShared("token"));
  }

  @override
  void dispose() {
    super.dispose();
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
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            automaticallyImplyLeading: false,
            // centerTitle: true,
            toolbarHeight: 80,
            elevation: 3,
            backgroundColor: Colors.white,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  "Ahmed Mohamed",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            actions: [
              Icon(
                Icons.phone,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.whatsapp,
                color: Colors.green,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Container(
              // height: MyApplication.hightClc(context, 700),  معدتش هتحتاجها الكونتينر بقى لعمل مارجن ف الاول بس لتخطيط الصفحة
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: OneChatScreen())),
    );
  }
}
