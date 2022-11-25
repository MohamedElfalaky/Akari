import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileCubit.dart';
import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileState.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/components/MarketProfileScreen.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketInfoWidget extends StatelessWidget {
  final String? name;
  final String? pic;
  const MarketInfoWidget({this.name, this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: EdgeInsets.only(bottom: MyApplication.hightClc(context, 16)),
      height: MyApplication.hightClc(context, 116),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(1),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () {},
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: BlocBuilder<MarketProfileCubit, MarketProfileState>(
                      builder: (context, state) {
                        return state is MarketProfileSuccess
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: state.myMarketProfileModel.data!
                                            .hasMedia ==
                                        true
                                    ? Image.network(state
                                        .myMarketProfileModel.data!.media!
                                        .where((element) =>
                                            element.collectionName == 'avatar')
                                        .first
                                        .thumb!)
                                    : Image.network(noReturant))
                            : SizedBox();
                        // CircularProgressIndicator();
                      },
                    ),
                  ),
                  SizedBox(
                    width: MyApplication.widthClc(context, 8),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<MarketProfileCubit, MarketProfileState>(
                        builder: (context, state) {
                          return state is MarketProfileSuccess
                              ? SizedBox(
                                  width: 200,
                                  child: Text(
                                    state.myMarketProfileModel.data!.name!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              : SizedBox();
                          // CircularProgressIndicator();
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: const Center(
                              child: Text(
                                "Burger",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: MyApplication.widthClc(context, 8)),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: const Center(
                              child: Text("Tasty",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
