import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen();

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  // MoreController _MoreController = MoreController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _MoreController.MoreAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: []);
  }
}
