import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/AddDetails.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';
import 'package:akari/presentation/screens/AppMain/controller/AppMainController.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    appMainController.AppMainAPIs(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: myApplication.hightClc(context, 181),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: myAppBar(),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ////////// adds bar
                CacheHelper.getFromShared("isAdvertiser") == "yes"
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "My Ads.",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Tajawal"),
                              ),
                              Spacer(),
                              InkWell(
                                // onTap: () => Navigator.pushNamed(context, "/allcategory"),
                                child: Text(
                                  "View All",
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
                              margin: EdgeInsets.only(top: 8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    // scrollDirection: Axis.horizontal,
                                    children: adsTaps.map((e) {
                                  return Container(
                                    height: 80,
                                    width: 140,
                                    margin: EdgeInsets.only(right: 16),
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
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "123",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(e["name"],
                                                    style: TextStyle(
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
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    : SizedBox(),
                /////////// catigory bar
                Row(
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/allcategory"),
                      child: Text(
                        "View All",
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
                    margin: EdgeInsets.only(top: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          // scrollDirection: Axis.horizontal,
                          children: categoryTaps),
                    )),

                Container(
                    margin: EdgeInsets.only(
                        top: myApplication.hightClc(context, 24)),
                    child: Text(
                      "Best Ads",
                      style: TextStyle(fontSize: 20, fontFamily: "Tajawal"),
                    )),
                Container(
                    height: myApplication.hightClc(context, 447),
                    margin: EdgeInsets.only(top: 8),
                    child: Center(
                      child: BlocBuilder<AllAddsCubit, AllAddsState>(
                        builder: (context, state) {
                          return state is AllAddsSuccess
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.myAllAddsModel.data.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () => myApplication.navigateTo(
                                            AddDetails(
                                              contractType: state.myAllAddsModel
                                                  .data[index].contractType,
                                              buildingType: state.myAllAddsModel
                                                  .data[index].buildingType,
                                              deliveryTerm: state
                                                  .myAllAddsModel
                                                  .data[index]
                                                  .details
                                                  .deliveryTerm,
                                              address: state.myAllAddsModel
                                                  .data[index].address.state,
                                              createdAt: state.myAllAddsModel
                                                  .data[index].createdAt,
                                              description: state.myAllAddsModel
                                                  .data[index].description,
                                              area: state.myAllAddsModel
                                                  .data[index].details.area
                                                  .toString(),
                                              floor: state.myAllAddsModel
                                                  .data[index].details.floors
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
                                              amenities: state.myAllAddsModel
                                                  .data[index].amenities,
                                              priceSd: state.myAllAddsModel
                                                  .data[index].price.inSP
                                                  .toString(),
                                              priceDollar: state.myAllAddsModel
                                                  .data[index].price.inUSD
                                                  .toString(),
                                              phone: state.myAllAddsModel
                                                  .data[index].mobileNumber
                                                  .toString(),
                                              advertiserId: state.myAllAddsModel
                                                  .data[index].advertiser
                                                  .toString(),
                                              // isFavorite: false,
                                            ),
                                            context),
                                        child: BestAdsItem(
                                          img: state.myAllAddsModel.data[index]
                                              .images.first.normal,
                                          title: state
                                              .myAllAddsModel.data[index].title,
                                          area: state.myAllAddsModel.data[index]
                                              .details.area
                                              .toString(),
                                          floors: state.myAllAddsModel
                                              .data[index].details.floors
                                              .toString(),
                                          statee: state.myAllAddsModel
                                              .data[index].address.state,
                                          createdAt: DateTime.parse(
                                            state.myAllAddsModel.data[index]
                                                .createdAt,
                                          ),
                                          price: state.myAllAddsModel
                                              .data[index].price.inSP
                                              .toString(),
                                          priceDollar: state.myAllAddsModel
                                              .data[index].price.inUSD
                                              .toString(),
                                          isFavorite: false,
                                        ));
                                  },
                                )
                              : Center(
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
      floatingActionButton: ViewOnMap(),
    );
  }
}
