import 'package:client_app/data/cubits/OfferRateCubit/OfferRateCubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stack3 extends StatelessWidget {
  const Stack3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferRateCubit, OfferRateState>(
      builder: (context, state) {
        return OfferRateCubit.get(context).flag
            ? Align(
                alignment: Alignment(0, 0.9),
                child: SizedBox(
                    width: MyApplication.widthClc(context, 380),
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.food_bank),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Items',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 20,
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
              )
            : Container();
      },
    );
  }
}
