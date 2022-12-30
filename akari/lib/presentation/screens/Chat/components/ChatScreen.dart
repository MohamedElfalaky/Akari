import 'package:akari/data/cubits/GetRooms/GetRoomsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/screens/Chat/components/OneChatCard.dart';
import 'package:akari/presentation/screens/Chat/controller/ChatController.dart';
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
  ChatController _ChatController = ChatController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (CacheHelper.getFromShared("token") != null) {
      _ChatController.ChatAPIs(context, CacheHelper.getFromShared("token"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getFromShared("token") == null
        ? Center(
            child: Text("Log in to reach your chat rooms"),
          )
        : BlocBuilder<GetRoomsCubit, GetRoomsState>(
            builder: (context, state) {
              return state is GetRoomsSuccess
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.myGetRoomsModel.data!.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () => myApplication.navigateTo(
                                OneChatPage(
                                  image: state.myGetRoomsModel.data![index]
                                      .participant!.image,
                                  namee: state.myGetRoomsModel.data![index]
                                      .participant!.name,
                                  roomId: state.myGetRoomsModel.data![index].id,
                                  receiverId: state.myGetRoomsModel.data![index]
                                      .participant!.id,
                                  senderId: state
                                      .myGetRoomsModel.data![index].senderId,
                                  phoneNumber: state.myGetRoomsModel
                                      .data![index].participant!.phone,
                                ),
                                context),
                            child: OneChatCard(
                              img: state.myGetRoomsModel.data![index]
                                  .participant!.image,
                              namee: state.myGetRoomsModel.data![index]
                                  .participant!.name,
                              lastMassage: state
                                  .myGetRoomsModel.data![index].lastMessage,
                            ),
                          ))
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          );
  }
}
