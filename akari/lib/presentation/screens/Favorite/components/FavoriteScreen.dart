import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
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
    return CacheHelper.getFromShared("token") == null
        ? Center(
            child: Text("Please log in to access your favourite list"),
          )
        : ListView(shrinkWrap: true, children: [
            BestAdsItem(),
            BestAdsItem(),
            BestAdsItem(),
            BestAdsItem(),
          ]);
  }
}
