import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/Meal.dart';
import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MealsListView extends StatelessWidget {
  MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyApplication.hightClc(context, 370),
      child: ScrollablePositionedList.builder(
        itemCount: 18,
        itemBuilder: (context, index) => Meal(),
        itemScrollController: MarketProfileController.itemController,
      ),
    );
  }
}
