import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/widgets/AppMain/BestAdsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen();

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // FavoriteController _FavoriteController = FavoriteController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _FavoriteController.FavoriteAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      BestAdsItem(myBool: true),
      BestAdsItem(myBool: true),
      BestAdsItem(myBool: true),
      BestAdsItem(myBool: true),
    ]);
  }
}
