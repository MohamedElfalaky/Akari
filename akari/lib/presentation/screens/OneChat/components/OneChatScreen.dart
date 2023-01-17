import 'package:akari/App/constants.dart';
import 'package:akari/data/cubits/GetMassages/GetMassagesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/OneChat/components/OwnMassageCard.dart';
import 'package:akari/presentation/screens/OneChat/components/ReplyCard.dart';
import 'package:akari/presentation/screens/OneChat/controller/OneChatController.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../../../helpers/AppLocalizations.dart';

class OneChatScreen extends StatefulWidget {
  final String? roomId;
  final String? receiver;
  final String? senderr;
  const OneChatScreen(
      {required this.roomId, required this.receiver, required this.senderr});

  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  OneChatController _OneChatController = OneChatController();
  TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController1 = ScrollController();
  // ScrollController _scrollController2 = ScrollController();
  List<dynamic> msgs = [];
  Socket? socket;

  _initTheSocket() {
    socket = io(baseURL, {
      "transports": ["websocket"],
      "autoConnect": false,
      "query": {"token": "${CacheHelper.getFromShared("token")}"}
    });

    socket!.on("message", (msgIbjct) {
      print(" فيه رسالة اتبعتت");
      setMessage(msgIbjct["message"], msgIbjct["senderId"]);
    });
    // socket!.connect();
    // socket!.onConnect((_) {
    //   print("السوكت التاني اتربط");

    // });
  }

  sendMassage(String msg, String receiverId, String senderId) {
    // setMessage(msg, senderId);
    socket!.emit("sendmessage",
        {"message": msg, "receiverId": receiverId, "senderId": senderId});
  }

  setMessage(String theMsg, String id) {
    String type;
    if (id == widget.senderr) {
      type = "sent";
    } else if (id == widget.receiver) {
      type = "received";
    } else {
      type = "";
    }
    if (mounted) {
      setState(() {
        msgs.add({"massage": theMsg, "type": type});
      });
    }
    if (_scrollController1.hasClients) {
      _scrollController1.animateTo(_scrollController1.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (_scrollController1.hasClients) {
    //     _scrollController1.animateTo(
    //         _scrollController1.position.maxScrollExtent,
    //         duration: Duration(milliseconds: 300),
    //         curve: Curves.easeOut);
    //   }
    // });
    // TODO: implement initState

    super.initState();
    _OneChatController.oneChatAPIs(
        context, CacheHelper.getFromShared("token"), widget.roomId!);
    _initTheSocket();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _scrollController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // height: MediaQuery.of(context).size.height - 200,
          child: BlocBuilder<GetMassagesCubit, GetMassagesState>(
            builder: (context, state) {
              return state is GetMassagesSuccess
                  ? ListView(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: _scrollController1,

                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.myGetMassagesModel.data!.length,
                          itemBuilder: (context, index) {
                            return state.myGetMassagesModel.data![index]
                                        .sender ==
                                    widget.receiver
                                ? ReplyCard(
                                    msg: state.myGetMassagesModel.data![index]
                                        .message)
                                : OwnMassageCard(
                                    msg: state.myGetMassagesModel.data![index]
                                        .message);
                          },
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: msgs.length + 1,
                          itemBuilder: (context, index) {
                            if (index == msgs.length) {
                              return Container(
                                height: 50,
                              );
                            }
                            return msgs[index]["type"] == "sent"
                                ? OwnMassageCard(msg: msgs[index]["massage"])
                                : ReplyCard(msg: msgs[index]["massage"]);
                          },
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            width: double.infinity,
            child: myTextField(
              isLabled: false,
              controller: _chatController,
              keyBoardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              clr: Colors.white,
              hint: "write your message here..".tr(context),
              suffix: InkWell(
                onTap: () {
                  sendMassage(
                      _chatController.text, widget.receiver!, widget.senderr!);
                  _chatController.clear();
                },
                child: Icon(
                  Icons.send,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
