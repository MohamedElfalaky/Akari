import 'package:client_app/data/cubits/OfferRateCubit/OfferRateCubit.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/InsideStack/MarketInfoWidget.dart';
import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../InsideStack/MealsListView.dart';

class HotOfferRating extends StatefulWidget {
  const HotOfferRating({super.key});

  @override
  State<HotOfferRating> createState() => _HotOfferRatingState();
}

class _HotOfferRatingState extends State<HotOfferRating> {
  // MarketProfileController mrktProfileController = MarketProfileController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            OfferRateCubit.get(context).changeToOffer();
          },
          child: Container(
            height: 83,
            width: 83,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: OfferRateCubit.get(context).flag
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF3635371A).withOpacity(0.1),
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal)
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  rateOrder,
                  height: 30,
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  "Hot Offer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => OfferRateCubit.get(context).changeToRate(),
          child: Container(
            height: 83,
            width: 83,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: OfferRateCubit.get(context).flag == false
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF3635371A),
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal)
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  startss,
                  height: 30,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Rating",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "4.7 starts",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
