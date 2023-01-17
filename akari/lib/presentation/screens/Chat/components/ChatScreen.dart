import 'package:akari/App/constants.dart';

import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/Chat/components/OneChatCard.dart';
import 'package:akari/presentation/screens/Chat/controller/ChatController.dart';
import 'package:akari/presentation/screens/OneChat/OneChatPage.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../../../helpers/AppLocalizations.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Socket? mySocket;
  // ignore: prefer_typing_uninitialized_variables
  var roomsModel;

  @override
  void initState() {
    super.initState();
    if (CacheHelper.getFromShared("token") != null) {
      initTheSocket();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getFromShared("token") == null
        ? Center(
            child: Text("Log in to reach your chat rooms".tr(context)),
          )
        : roomsModel != null && roomsModel != "unAuth"
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: roomsModel!["data"]!.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // mySocket!.dispose();
                        // mySocket!.disconnect();
                        // mySocket!.destroy();
                        myApplication.navigateTo(
                            OneChatPage(
                              image: roomsModel!["data"][index]["participant"]
                                  ["image"],
                              namee: roomsModel!["data"][index]["participant"]
                                  ["name"],
                              roomId: roomsModel!["data"][index]["_id"],
                              receiverId: roomsModel!["data"][index]
                                  ["participant"]["_id"],
                              senderId: roomsModel!["data"][index]["senderId"],
                              phoneNumber: roomsModel!["data"][index]
                                  ["participant"]["phone"],
                            ),
                            context);
                      },
                      child: OneChatCard(
                        img: roomsModel!["data"][index]["participant"]["image"],
                        namee: roomsModel!["data"][index]["participant"]
                            ["name"],
                        lastMassage: roomsModel!["data"][index]["lastMessage"],
                      ),
                    ))
            : roomsModel == "unAuth"
                ? Center(
                    child: Text("UnAuthrized, please log in".tr(context)),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
  }

  initTheSocket() {
    mySocket = io(baseURL,
        // OptionBuilder().setExtraHeaders()

        {
          "transports": ["websocket"],
          "autoConnect": false,
          "query": {"token": "${CacheHelper.getFromShared("token")}"}
        });
    mySocket!.connect();
    mySocket!.on("error", (data) {
      setState(() {
        roomsModel = "unAuth";
      });
    });
    mySocket!.onConnect((_) {
      print("Hello, mySocket connected!");

      mySocket!.emit("getRooms", {});
      mySocket!.on("rooms", (roomsObject) {
        print(" احنا في الرووووووومز ");
        if (mounted) {
          setState(() {
            roomsModel = roomsObject;
          });
        }
      });
    });
  }
}
