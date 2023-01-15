import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/AddDetails.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/AppMain/components/TabBarItem.dart';
import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';
import 'package:akari/presentation/screens/AppMain/controller/AppMainController.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  AppMainController appMainController = AppMainController();

  @override
  void initState() {
    super.initState();

    appMainController.AppMainAPIs(myContext: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: myApplication.hightClc(context, 181),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: const myAppBar(),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ////////// adds bar
                CacheHelper.getFromShared("token") != null
                    ? CacheHelper.getFromShared("isAdvertiser") == "yes"
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "My Ads.".tr(context),
                                    style: const TextStyle(
                                        fontSize: 20, fontFamily: "Tajawal"),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    // onTap: () => Navigator.pushNamed(context, "/allcategory"),
                                    child: Text(
                                      "View All".tr(context),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Tajawal,Regular",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 8),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        // scrollDirection: Axis.horizontal,
                                        children: adsTaps.map((e) {
                                      return Container(
                                        height: 80,
                                        width: 140,
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 12),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  e["img"],
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      e["no"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        e["name"]
                                                            .toString()
                                                            .tr(context),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList()),
                                  )),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          )
                        : const SizedBox()
                    : SizedBox(),
                /////////// catigory bar
                Row(
                  children: [
                    Text(
                      "Categories".tr(context),
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/allcategory"),
                      child: Text(
                        "View All".tr(context),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Tajawal,Regular",
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    )
                  ],
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          // scrollDirection: Axis.horizontal,
                          children: categoryDropDown
                              .map((e) => TabBarItem(
                                      e["name"].toString().tr(context),
                                      e["img"], () {
                                    appMainController.AppMainAPIs(
                                        myContext: context,
                                        buildingType: [e["name"]]);
                                  }))
                              .toList()),
                    )),

                Container(
                    margin: EdgeInsets.only(
                        top: myApplication.hightClc(context, 24)),
                    child: Text(
                      "Best Ads".tr(context),
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                    )),
                Container(
                    height: myApplication.hightClc(context, 447),
                    margin: const EdgeInsets.only(top: 8),
                    child: Center(
                      child: BlocBuilder<AllAddsCubit, AllAddsState>(
                        builder: (context, state) {
                          return state is AllAddsSuccess
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.myAllAddsModel.data.isEmpty
                                      ? 1
                                      : state.myAllAddsModel.data.length,
                                  itemBuilder: (context, index) {
                                    return state.myAllAddsModel.data.isEmpty
                                        ? Center(
                                            child: Text("No Items".tr(context)),
                                          )
                                        : InkWell(
                                            onTap: () =>
                                                myApplication.navigateTo(
                                                    AddDetails(
                                                      contractType: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .contractType,
                                                      buildingType: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .buildingType,
                                                      deliveryTerm: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .details
                                                          .deliveryTerm,
                                                      address: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .address
                                                          .state,
                                                      createdAt: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .createdAt
                                                          .toString(),
                                                      description: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .description,
                                                      area: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .details
                                                          .area
                                                          .toString(),
                                                      floor: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .details
                                                          .floors
                                                          .toString(),
                                                      bedRooms: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .details
                                                          .bedroomsCount
                                                          .toString(),
                                                      bathRooms: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .details
                                                          .bathroomCount
                                                          .toString(),
                                                      amenities: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .amenities,
                                                      priceSd: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .price
                                                          .inSP
                                                          .toString(),
                                                      priceDollar: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .price
                                                          .inUSD
                                                          .toString(),
                                                      phone: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .mobileNumber
                                                          .toString(),
                                                      advertiserId: state
                                                          .myAllAddsModel
                                                          .data[index]
                                                          .advertiser
                                                          .toString(),
                                                      adId: state.myAllAddsModel
                                                          .data[index].id,
                                                      // isFavorite: false,
                                                    ),
                                                    context),
                                            child: BestAdsItem(
                                              img: state
                                                      .myAllAddsModel
                                                      .data[index]
                                                      .images
                                                      .isNotEmpty
                                                  ? state
                                                      .myAllAddsModel
                                                      .data[index]
                                                      .images
                                                      .first
                                                      .normal
                                                  : defaultHouse,
                                              title: state.myAllAddsModel
                                                  .data[index].title,
                                              area: state.myAllAddsModel
                                                  .data[index].details.area
                                                  .toString(),
                                              floors: state.myAllAddsModel
                                                  .data[index].details.floors
                                                  .toString(),
                                              statee: state.myAllAddsModel
                                                  .data[index].address.state,
                                              createdAt: DateTime.parse(state
                                                  .myAllAddsModel
                                                  .data[index]
                                                  .createdAt),
                                              price: state.myAllAddsModel
                                                  .data[index].price.inSP
                                                  .toString(),
                                              priceDollar: state.myAllAddsModel
                                                  .data[index].price.inUSD
                                                  .toString(),
                                              adId: state.myAllAddsModel
                                                  .data[index].id,
                                              isFavorite: false,
                                            ));
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const ViewOnMap(),
    );
  }
}
