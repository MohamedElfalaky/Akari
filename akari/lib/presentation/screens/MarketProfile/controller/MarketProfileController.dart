import 'package:client_app/data/cubits/MarketCategoryCubit/MarketCategoryCubit.dart';
import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileCubit.dart';
import 'package:flutter/material.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MarketProfileController {
  ///vars

  ///methods
  void marketProfileAPIs(BuildContext context, int id) {
    MarketProfileCubit.get(context).getMarketProfile(id);
    MarketCategoryCubit.get(context).getMarketCategory(id);
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static final itemController = ItemScrollController(); // scroll to index

  static Future scrollToItem() async {
    itemController.scrollTo(
        index: 10, duration: Duration(milliseconds: 500)); // scroll to index
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
