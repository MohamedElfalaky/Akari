import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/OneChat/components/OwnMassageCard.dart';
import 'package:akari/presentation/screens/OneChat/components/ReplyCard.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneChatScreen extends StatefulWidget {
  const OneChatScreen();

  @override
  State<OneChatScreen> createState() => _OneChatScreenState();
}

class _OneChatScreenState extends State<OneChatScreen> {
  // OneChatController _OneChatController = OneChatController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _OneChatController.OneChatAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: ListView(
            shrinkWrap: true,
            children: [
              OwnMassageCard(),
              ReplyCard(),
              OwnMassageCard(),
              ReplyCard(),
              OwnMassageCard(),
              ReplyCard(),
              OwnMassageCard(),
              ReplyCard(),
              OwnMassageCard(),
              ReplyCard(),
              OwnMassageCard(),
              ReplyCard(),
            ],
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
