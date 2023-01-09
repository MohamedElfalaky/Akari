import 'package:akari/data/cubits/SearchFromHome/SearchFromHomeCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AppMain/components/BestAdsItem.dart';
import 'package:akari/presentation/widgets/Filter/AfterFilterAppBar.dart';
import 'package:akari/presentation/widgets/Shared/ViewOnMap.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AfterFilterAndSearch extends StatefulWidget {
  final title;
  const AfterFilterAndSearch(this.title);

  @override
  State<AfterFilterAndSearch> createState() => _AfterFilterAndSearchState();
}

class _AfterFilterAndSearchState extends State<AfterFilterAndSearch> {
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
          backgroundColor: Color(0xFFFFFFFF),
          toolbarHeight: myApplication.hightClc(context, 140),
          elevation: 0,
          title: AfterFilterAppBar(),
        ),
        body: Container(
          height: myApplication.hightClc(context, 640),
          margin: EdgeInsets.only(
            top: myApplication.hightClc(context, 8),
            right: myApplication.widthClc(context, 24),
            left: myApplication.widthClc(context, 24),
          ),
          child: BlocBuilder<SearchFromHomeCubit, SearchFromHomeState>(
            builder: (context, state) {
              return state is SearchFromHomeSuccess
                  ? ListView.builder(
                      itemCount: state.mySearchFromHomeModel.data.length,
                      itemBuilder: (context, index) {
                        return BestAdsItem(
                          img: state.mySearchFromHomeModel.data[index].images
                                  .isEmpty
                              ? defaultHouse
                              : state.mySearchFromHomeModel.data[index].images
                                  .first.normal,
                          title: state.mySearchFromHomeModel.data[index].title,
                          area: state
                              .mySearchFromHomeModel.data[index].details.area
                              .toString(),
                          floors: state
                              .mySearchFromHomeModel.data[index].details.floors
                              .toString(),
                          statee: state
                              .mySearchFromHomeModel.data[index].address.state,
                          createdAt: DateTime.now(),
                          price: state
                              .mySearchFromHomeModel.data[index].price.inSP
                              .toString(),
                          priceDollar: state
                              .mySearchFromHomeModel.data[index].price.inUSD
                              .toString(),
                          isFavorite: null,
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
        floatingActionButton: ViewOnMap(),

        // floatingActionButtonLocation: FloatingActionButtonLocation,
      ),
    );
  }
}
