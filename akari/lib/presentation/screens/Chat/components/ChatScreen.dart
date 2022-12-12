import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/Chat/components/OneChat.dart';
import 'package:akari/presentation/screens/OneChat/OneChatPage.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // ChatController _ChatController = ChatController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _ChatController.ChatAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      InkWell(
          onTap: () => myApplication.navigateTo(OneChatPage(), context),
          child: OneChat()),
      OneChat(
        img:
            "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
      ),
    ]);
  }
}
