import 'dart:math';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Repositries/AddAdvertiseRepo.dart';
import 'package:akari/data/Repositries/AddFavoriteRepo.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page2/P2Villa&Appartment.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page4/FormPage4.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page5/FormPage5.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page6/AdPosted.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page6/FormPage6.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'AddPricesState.dart';

class AddPriceCubit extends Cubit<AddPriceState> {
  AddPriceCubit() : super(AddPriceInitial());

  static AddPriceCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo AddPriceRepo = AddAdvertiseRepo();

  void userAddPrice(
      {required String inUSD,
      required String inSP,
      required String paymentOption,
      required String downPaymentPercentage,
      required bool onlyAcceptUSD,
      required bool isNegotiable,
      required String id,
      required String token,
      required String category,
      required context}) {
    try {
      emit(AddPriceLoading());
      AddPriceRepo.addPrice(
              inUSD: inUSD,
              inSP: inSP,
              paymentOption: paymentOption,
              downPaymentPercentage: downPaymentPercentage,
              onlyAcceptUSD: onlyAcceptUSD,
              isNegotiable: isNegotiable,
              id: id,
              token: token)
          .then((value) {
        if (value != null) {
          myApplication.navigateTo(
              FormPage6(id: id, category: category), context);

          emit(AddPriceSuccess(value));
        } else {
          print(value);
          emit(AddPriceError(value.toString()));
        }
      });
    } catch (e) {
      emit(AddPriceError(e.toString()));
    }
  }
}
