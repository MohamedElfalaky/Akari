// import 'dart:html' hide Platform;

import 'package:akari/data/cubits/IncreaseCall/IncreaseCallCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/OneChat/components/OneChatScreen.dart';
import 'dart:io' show Platform;
import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/AppLocalizations.dart';

class OneChatPage extends StatefulWidget {
  final image;
  final String? namee;
  final String? roomId;
  final String? receiverId;
  final String? phoneNumber;
  final String? senderId;
  OneChatPage(
      {this.image,
      this.namee,
      this.receiverId,
      this.roomId,
      this.phoneNumber,
      this.senderId});

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
                        image: NetworkImage(widget.image ?? noImg),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  widget.namee!,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  IncreaseCallCubit.get(context).userIncreaseCall(
                      context: context,
                      advertiserId: widget.receiverId!,
                      token: CacheHelper.getFromShared("token"),
                      userId: CacheHelper.getFromShared("id"));
                  launchUrl(Uri.parse("tel://+2${widget.phoneNumber}"));
                },
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  launchWhatsapp(widget.phoneNumber!, "hello");
                },
                child: Icon(
                  Icons.whatsapp,
                  color: Colors.green,
                ),
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
              child: OneChatScreen(
                  roomId: widget.roomId,
                  receiver: widget.receiverId,
                  senderr: widget.senderId))),
    );
  }

  void launchWhatsapp(String numberr, String massagee) async {
    String androidUrl = "whatsapp://send?phone=+2$numberr&text=$massagee";
    String iosUrl = "https://wa.me/+2$numberr?text=${Uri.parse(massagee)}";

    if (Platform.isIOS) {
      await canLaunchUrl(Uri.parse(
        iosUrl,
      ))
          ? launchUrl(Uri.parse(iosUrl))
          : myApplication.showToast(
              text: "cannot open whats app".tr(context),
              color: Theme.of(context).colorScheme.primary);
    } else {
      await canLaunchUrl(Uri.parse(
        androidUrl,
      ))
          ? launchUrl(Uri.parse(androidUrl))
          : myApplication.showToast(
              text: "cannot open whats app".tr(context),
              color: Theme.of(context).colorScheme.primary);
    }
  }
}
