import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/AddDetails.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/Favorite/controller/CartController.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/AppLocalizations.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen();

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GetFavoritesController _FavoriteController = GetFavoritesController();

  @override
  void initState() {
    super.initState();
    _FavoriteController.getFavoritesAPIs(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getFromShared("token") == null
        ? Center(
            child:
                Text("Please log in to access your favourite list".tr(context)),
          )
        : BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
            builder: (context, state) {
              return state is GetFavoritesSuccess
                  ? ListView.builder(
                      itemCount: state.myGetFavoritesModel.data!.length == 0
                          ? 1
                          : state.myGetFavoritesModel.data!.length,
                      itemBuilder: (context, index) {
                        return state.myGetFavoritesModel.data!.length == 0
                            ? Center(
                                child:
                                    Text("Favorites list is empty".tr(context)))
                            : InkWell(
                                onTap: () => myApplication.navigateTo(
                                    AddDetails(
                                      contractType: state.myGetFavoritesModel
                                          .data![index].contractType,
                                      buildingType: state.myGetFavoritesModel
                                          .data![index].buildingType,
                                      deliveryTerm: state.myGetFavoritesModel
                                          .data![index].details!.deliveryTerm,
                                      address: state.myGetFavoritesModel
                                          .data![index].address!.state,
                                      createdAt: state.myGetFavoritesModel
                                          .data![index].createdAt
                                          .toString(),
                                      description: state.myGetFavoritesModel
                                          .data![index].description,
                                      area: state.myGetFavoritesModel
                                          .data![index].details!.area
                                          .toString(),
                                      floor: state.myGetFavoritesModel
                                          .data![index].details!.floors
                                          .toString(),
                                      bedRooms: state.myGetFavoritesModel
                                          .data![index].details!.bedroomsCount
                                          .toString(),
                                      bathRooms: state.myGetFavoritesModel
                                          .data![index].details!.bathroomCount
                                          .toString(),
                                      amenities: state.myGetFavoritesModel
                                          .data![index].amenities,
                                      priceSd: state.myGetFavoritesModel
                                          .data![index].price!.inSp
                                          .toString()
                                          .toString(),
                                      priceDollar: state.myGetFavoritesModel
                                          .data![index].price!.inUsd
                                          .toString()
                                          .toString(),
                                      phone: state.myGetFavoritesModel
                                          .data![index].mobileNumber
                                          .toString(),
                                      advertiserId: state.myGetFavoritesModel
                                          .data![index].advertiser
                                          .toString(),
                                      adId: state
                                          .myGetFavoritesModel.data![index].id,
                                      isFavorite: true,
                                    ),
                                    context),
                                child: BestAdsItem(
                                  img: state.myGetFavoritesModel.data![index]
                                          .images!.isNotEmpty
                                      ? state.myGetFavoritesModel.data![index]
                                          .images!.first.normal
                                      : defaultHouse,
                                  title: state
                                      .myGetFavoritesModel.data![index].title,
                                  area: state.myGetFavoritesModel.data![index]
                                      .details!.area
                                      .toString(),
                                  floors: state.myGetFavoritesModel.data![index]
                                      .details!.floors
                                      .toString(),
                                  statee: state.myGetFavoritesModel.data![index]
                                      .address!.state,
                                  createdAt: state.myGetFavoritesModel
                                      .data![index].createdAt,
                                  price: state.myGetFavoritesModel.data![index]
                                      .price!.inSp
                                      .toString(),
                                  priceDollar: state.myGetFavoritesModel
                                      .data![index].price!.inUsd
                                      .toString(),
                                  adId:
                                      state.myGetFavoritesModel.data![index].id,
                                  isFavorite: true,
                                ),
                              );
                      },
                      shrinkWrap: true,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          );
  }
}
