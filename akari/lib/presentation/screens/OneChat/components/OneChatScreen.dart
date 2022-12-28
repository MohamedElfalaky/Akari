import 'package:akari/data/cubits/GetMassages/GetMassagesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/OneChat/components/OwnMassageCard.dart';
import 'package:akari/presentation/screens/OneChat/components/ReplyCard.dart';
import 'package:akari/presentation/screens/OneChat/controller/OneChatController.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneChatScreen extends StatefulWidget {
  final String? roomId;
  final String? receiver;
  const OneChatScreen({required this.roomId, required this.receiver});

  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  OneChatController _OneChatController = OneChatController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _OneChatController.oneChatAPIs(
        context, CacheHelper.getFromShared("token"), widget.roomId!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: BlocBuilder<GetMassagesCubit, GetMassagesState>(
            builder: (context, state) {
              return state is GetMassagesSuccess
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.myGetMassagesModel.data!.length,
                      itemBuilder: (context, index) {
                        return state.myGetMassagesModel.data![index].sender ==
                                widget.receiver
                            ? ReplyCard(
                                msg: state
                                    .myGetMassagesModel.data![index].message)
                            : OwnMassageCard(
                                msg: state
                                    .myGetMassagesModel.data![index].message);
                      },
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
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: myTextField(
              keyBoardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              clr: Colors.white,
              hint: "write your message here..",
              suffix: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
