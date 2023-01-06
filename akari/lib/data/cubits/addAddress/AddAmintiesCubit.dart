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
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'addAddressState.dart';

class addAddressCubit extends Cubit<addAddressState> {
  addAddressCubit() : super(addAddressInitial());

  static addAddressCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo addAddressRepo = AddAdvertiseRepo();

  void useraddAddress(String state, String district, String detailedAdd,
      String pBox, String id, String token, String category, context) {
    try {
      emit(addAddressLoading());
      addAddressRepo
          .addAddress(state, district, detailedAdd, pBox, id, token)
          .then((value) {
        if (value != null) {
          myApplication.navigateTo(
              FormPage5(id: id, category: category), context);

          emit(addAddressSuccess(value));
          // GetFavoritesCubit.get(context).userGetFavorites(token);

        } else {
          print(value);
          emit(addAddressError(value.toString()));
        }
      });
    } catch (e) {
      emit(addAddressError(e.toString()));
    }
  }
}
