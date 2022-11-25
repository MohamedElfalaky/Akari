import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileCubit.dart';
import 'package:client_app/data/cubits/MarketProfileCubit/MarketProfileState.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MarketProfile/MarketProfile.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/global.dart';

class MarketProfileAppBar extends StatelessWidget {
  const MarketProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MyApplication.widthClc(context, 12),
          right: MyApplication.widthClc(context, 12),
          top: MyApplication.hightClc(context, 24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MyApplication.hightClc(context, 52),
            width: MyApplication.widthClc(context, 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.5),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          BlocBuilder<MarketProfileCubit, MarketProfileState>(
            builder: (context, state) {
              return state is MarketProfileSuccess
                  ? SizedBox(
                      width: 160,
                      child: Text(state.myMarketProfileModel.data!.name!,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip),
                    )
                  : SizedBox(
                      height: 20,
                      width: 20,
                      // child: CircularProgressIndicator(),
                    );
            },
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(.5),
              ),
              height: MyApplication.hightClc(context, 52),
              width: MyApplication.widthClc(context, 48),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(searchIcon)),
        ],
      ),
    );
  }
}
