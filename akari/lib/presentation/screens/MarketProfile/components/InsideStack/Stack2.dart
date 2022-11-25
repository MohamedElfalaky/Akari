import 'package:client_app/data/cubits/OfferRateCubit/OfferRateCubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/CategoBar.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/HotOfferRating.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/MarketInfoWidget.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/MealsListView.dart';
import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stack2 extends StatelessWidget {
  const Stack2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferRateCubit, OfferRateState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment(0, 1.4),
          child: Container(
              height: MyApplication.hightClc(context, 700),
              width: MyApplication.widthClc(context, 380),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(children: [
                MarketInfoWidget(),
                HotOfferRating(),
                OfferRateCubit.get(context).flag
                    ? CategoBar()
                    : Container(
                        margin: EdgeInsets.only(
                            top: MyApplication.hightClc(context, 120),
                            bottom: MyApplication.hightClc(context, 20)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 242, 179, 6),
                            ),
                            Text(
                              "Customer Reviews",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                OfferRateCubit.get(context).flag
                    ? MealsListView()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating: 2.75,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 50.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      )
              ])),
        );
      },
    );
    ;
  }
}
