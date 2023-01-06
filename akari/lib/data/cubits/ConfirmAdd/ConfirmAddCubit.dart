import 'dart:math';

import 'package:akari/data/Models/AllAddsModel.dart';
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
import 'package:akari/presentation/screens/AdvertisrForm/components/page6/FormPage6.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ConfirmAddState.dart';

class ConfirmAddCubit extends Cubit<ConfirmAddState> {
  ConfirmAddCubit() : super(ConfirmAddInitial());

  static ConfirmAddCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo ConfirmAddRepo = AddAdvertiseRepo();

  void userConfirmAdd(
      {required String name,
      required String mobileNumber,
      required String capacity,
      required String contactMethod,
      required bool termsAccepted,
      required String id,
      required String token,
      required String category,
      required context}) {
    try {
      emit(ConfirmAddLoading());
      ConfirmAddRepo.confirmAdd(
        name: name,
        mobileNumber: mobileNumber,
        capacity: capacity,
        contactMethod: contactMethod,
        termsAccepted: termsAccepted,
        id: id,
        token: token,
      ).then((value) {
        if (value != null) {
          myApplication.navigateTo(AppMain(), context);

          emit(ConfirmAddSuccess(value));
        } else {
          print(value);
          emit(ConfirmAddError(value.toString()));
        }
      });
    } catch (e) {
      emit(ConfirmAddError(e.toString()));
    }
  }
}
