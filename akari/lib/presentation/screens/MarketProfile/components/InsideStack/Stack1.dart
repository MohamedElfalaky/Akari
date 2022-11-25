import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileCubit.dart';
import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileState.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/MarketProfile.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stack1 extends StatelessWidget {
  const Stack1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyApplication.hightClc(context, 810),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MyApplication.hightClc(context, 175),
            child: BlocBuilder<MarketProfileCubit, MarketProfileState>(
              builder: (context, state) {
                return state is MarketProfileSuccess
                    ? FittedBox(
                        fit: BoxFit.fill,
                        child: state.myMarketProfileModel.data!.hasMedia == true
                            ? Image.network(state
                                .myMarketProfileModel.data!.media![0].thumb!)
                            : Text("No Image"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          )
        ],
      ),
    );
    ;
  }
}
