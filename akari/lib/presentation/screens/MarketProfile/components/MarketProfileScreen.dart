import 'dart:ffi';

import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileCubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/controller/HomeController.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/Stack1.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/Stack2.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/Stack3.dart';
import 'package:client_app/presentation/widgets/MyButton.dart';
import 'package:flutter/material.dart';
import '../controller/MarketProfileController.dart';

class MarketProfileScreen extends StatefulWidget {
  final int id;
  const MarketProfileScreen(this.id);

  @override
  State<MarketProfileScreen> createState() => _MarketProfileScreenState();
}

class _MarketProfileScreenState extends State<MarketProfileScreen> {
  MarketProfileController _marketProfileController = MarketProfileController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marketProfileController.marketProfileAPIs(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MyApplication.hightClc(context, 810),
          child: Stack(children: [
            Stack1(), Stack2(), Stack3() // 3rd
          ]),
        ),
      ],
    );
  }
}
