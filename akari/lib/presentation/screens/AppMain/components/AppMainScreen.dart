import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/AddDetails.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/screens/AppMain/components/TabBarItem.dart';
import 'package:akari/presentation/screens/AppMain/components/myAppBar.dart';
import 'package:akari/presentation/screens/AppMain/controller/AppMainController.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        toolbarHeight: myApplication.hightClc(context, 181),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: myAppBar(),
      ),
      body: ListView(
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
                                  itemCount: state.myAllAddsModel.data!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () => myApplication.navigateTo(
                                            AddDetails(), context),
                                        child: BestAdsItem(
                                          img: state.myAllAddsModel.data![index]
                                              .images!.first,
                                          title: state.myAllAddsModel
                                              .data![index].title,
                                          area: state.myAllAddsModel
                                              .data![index].roomsAndBeds!.area
                                              .toString(),
                                          floors: state.myAllAddsModel
                                              .data![index].roomsAndBeds!.floors
                                              .toString(),
                                          statee: state.myAllAddsModel
                                              .data![index].address!.state,
                                          createdAt: state.myAllAddsModel
                                              .data![index].createdAt,
                                          price: state
                                              .myAllAddsModel.data![index].price
                                              .toString(),
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
