import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/data/cubits/MyAds/MyAdsCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/AddDetails.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/More/controller/MoreController.dart';

import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';

import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class MyAdsScreen extends StatefulWidget {
  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  MoreController _moreController = MoreController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moreController.MoreAPIs(myContext: context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // remove back button in appbar.
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          elevation: 0,
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("My Ads.".tr(context)),
        ),
        body: Container(
          // height: myApplication.hightClc(context, 640),
          margin: const EdgeInsets.only(
            top: 8,
            right: 24,
            left: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///////////// Statistics
              const SizedBox(
                height: 12,
              ),
              Text(
                "Statistics".tr(context),
                style: const TextStyle(fontSize: 14, fontFamily: "Tajawal"),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/adsSoNew.svg",
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          context
                                              .watch<MyAdsCubit>()
                                              .ads
                                              .toString(), //from api
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Ads.".toString().tr(context),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/viewsSoNew.svg",
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          context
                                              .watch<MyAdsCubit>()
                                              .views
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Views".toString().tr(context),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///
                          ///
                          ///
                          Container(
                            height: 80,
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/callsSoNew.svg",
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          context
                                                      .watch<GetUserDataCubit>()
                                                      .calls
                                                      .toString() ==
                                                  "null"
                                              ? ""
                                              : context
                                                  .watch<GetUserDataCubit>()
                                                  .calls
                                                  .toString(), //from api
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Calls".toString().tr(context),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ))),
              const SizedBox(
                height: 25,
              ),

              ///////////// Search
              Text(
                "Ads.".tr(context),
                style: const TextStyle(fontSize: 14, fontFamily: "Tajawal"),
              ),
              // const SizedBox(
              //   height: 4,
              // ),
              // SearchFilter(() => myApplication.navigateToRemove(
              //     context, const AfterFilterAndSearch("result"))),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 600,
                child: BlocBuilder<MyAdsCubit, MyAdsState>(
                  builder: (context, state) {
                    return state is MyAdsSuccess
                        ? ListView.builder(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: state.myMyAdsModel.data!.isEmpty
                                ? 1
                                : state.myMyAdsModel.data!.length,
                            itemBuilder: (context, index) {
                              return state.myMyAdsModel.data!.isEmpty
                                  ? Center(
                                      child: Text("No Data".tr(context)),
                                    )
                                  : InkWell(
                                      onTap: () => myApplication.navigateTo(
                                          AddDetails(
                                            contractType: state.myMyAdsModel
                                                .data![index].contractType,
                                            buildingType: state.myMyAdsModel
                                                .data![index].buildingType,
                                            deliveryTerm: state
                                                .myMyAdsModel
                                                .data![index]
                                                .details!
                                                .deliveryTerm,
                                            address: state.myMyAdsModel
                                                .data![index].address?.state,
                                            createdAt: state.myMyAdsModel
                                                .data![index].createdAt
                                                .toString(),
                                            description: state.myMyAdsModel
                                                .data![index].description,
                                            area: state.myMyAdsModel
                                                .data![index].details?.area
                                                .toString(),
                                            floor: state.myMyAdsModel
                                                .data?[index].details?.floor
                                                .toString(),
                                            bedRooms: state
                                                .myMyAdsModel
                                                .data![index]
                                                .details
                                                ?.bedroomsCount
                                                .toString(),
                                            bathRooms: state
                                                .myMyAdsModel
                                                .data![index]
                                                .details
                                                ?.bathroomCount
                                                .toString(),
                                            amenities: state.myMyAdsModel
                                                .data![index].amenities,
                                            priceSd: state.myMyAdsModel
                                                .data![index].price?.inSp
                                                .toString(),
                                            priceDollar: state.myMyAdsModel
                                                .data![index].price?.inUsd
                                                .toString(),
                                            phone: state.myMyAdsModel
                                                .data![index].mobileNumber
                                                .toString(),
                                            advertiserId: state.myMyAdsModel
                                                .data![index].advertiser
                                                .toString(),
                                            adId: state
                                                .myMyAdsModel.data![index].id,
                                            isFavorite: false,
                                          ),
                                          context),
                                      child: BestAdsItem(
                                        img: state.myMyAdsModel.data![index]
                                                .images!.isNotEmpty
                                            ? state.myMyAdsModel.data![index]
                                                .images!.first["normal"]
                                            : defaultHouse,
                                        title: state
                                            .myMyAdsModel.data![index].title,
                                        area: state.myMyAdsModel.data![index]
                                            .details!.area
                                            .toString(),
                                        floors: state.myMyAdsModel.data![index]
                                            .details!.floor
                                            .toString(),
                                        statee: state.myMyAdsModel.data![index]
                                            .address?.state,
                                        createdAt: state.myMyAdsModel
                                            .data![index].createdAt,
                                        price: state.myMyAdsModel.data![index]
                                            .price?.inSp
                                            .toString(),
                                        priceDollar: state.myMyAdsModel
                                            .data![index].price?.inUsd
                                            .toString(),
                                        adId:
                                            state.myMyAdsModel.data?[index].id,
                                      ),
                                    );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
