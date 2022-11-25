import 'package:client_app/data/cubits/MarketCategoryCubit/MarketCategoryCubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoBar extends StatelessWidget {
  const CategoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: MyApplication.hightClc(context, 30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 30,
            width: 30,
            child: SvgPicture.asset(categoBar),
          ),
          BlocBuilder<MarketCategoryCubit, MarketCategoryState>(
            builder: (context, state) {
              return SizedBox(
                  width: MyApplication.widthClc(context, 320),
                  child: state is MarketCategorySuccess
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              state.myMarketCategoryModel.data!.length == 0
                                  ? 1
                                  : state.myMarketCategoryModel.data!.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              state.myMarketCategoryModel.data!.length == 0
                                  ? "No categories!"
                                  : state
                                      .myMarketCategoryModel.data![index].name!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            // width: MyApplication.widthClc(context, 100),
                          ),
                        )
                      : Text("Loading.."));
            },
          ),
        ],
      ),
    );
  }
}
