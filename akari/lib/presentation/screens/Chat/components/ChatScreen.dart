import 'dart:async';

import 'package:akari/App/constants.dart';
import 'package:akari/data/Models/get_rooms_model/get_rooms_model.dart';
import 'package:akari/data/cubits/GetRooms/GetRoomsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/screens/Chat/components/OneChatCard.dart';
import 'package:akari/presentation/screens/Chat/controller/ChatController.dart';
import 'package:akari/presentation/screens/OneChat/OneChatPage.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController _ChatController = ChatController();
  Socket? mySocket;
  var roomsModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (CacheHelper.getFromShared("token") != null) {
      initTheSocket();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getFromShared("token") == null
        ? Center(
            child: Text("Log in to reach your chat rooms"),
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
                    child: Text("UnAuthrized, please log in"),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
  }
  // else if (state is GetRoomsError) {
  //   return Center(
  //     child: Text(
  //         "Ops!, ${state.error}, please Log in to reach your chat rooms"),
  //   );
  // } else {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }

  initTheSocket() {
    mySocket = io(baseURL,
        // OptionBuilder().setExtraHeaders()

        {
          "transports": ["websocket"],
          "autoConnect": false,
          "query": {"token": "${CacheHelper.getFromShared("token")}"}
        });
    mySocket!.connect();
    // mySocket!.onConnectError((data) {
    //   print("error almost for auth");
    //   setState(() {
    //     roomsModel = "unAuth";
    //   });
    // });
    // Timer(Duration(seconds: 5), () {
    //   if (!mySocket!.connected) {
    //     setState(() {
    //       roomsModel = "unAuth";
    //     });
    //   }
    // });
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

  // setRooms(rooms) {
  //   return rooms;
  //   // if (mounted) {
  //   //   setState(() {
  //   //     myRooms.add({"massage": theMsg, "type": type});
  //   //   });
  //   // }
  // }

  // socketIO = SocketIOManager().createSocketIO('someUrl', '/', query: 'token=$tok?userType=1', socketStatusCallback: _socketStatus);
}
