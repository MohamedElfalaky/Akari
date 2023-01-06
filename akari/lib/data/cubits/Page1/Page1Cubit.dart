import 'dart:math';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Models/page1_model/page1_model.dart';
import 'package:akari/data/Repositries/AddAdvertiseRepo.dart';
import 'package:akari/data/Repositries/AddFavoriteRepo.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page2/P2Villa&Appartment.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'Page1State.dart';

class Page1Cubit extends Cubit<Page1State> {
  Page1Cubit() : super(Page1Initial());

  static Page1Cubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo page1Repo = AddAdvertiseRepo();

  void userPage1(
      String buildingType, String contractType, String token, context) {
    try {
      emit(Page1Loading());
      page1Repo.page1(buildingType, contractType, token).then((value) {
        if (value != null) {
          if (buildingType == "Apartment, Duplex" || buildingType == "Villa") {
            print(value.data!.id!);
            print(CacheHelper.getFromShared("token"));
            myApplication.navigateTo(
                P2VillaAppartment(
                  category: buildingType,
                  contractType: contractType,
                  id: value.data!.id!,
                  contractType2: buildingType == "Apartment, Duplex"
                      ? ["Apartment", "Duplex"]
                      : ["Stand Alone", "Town House", "Twin House"],
                  isSelected2: buildingType == "Apartment, Duplex"
                      ? [true, false]
                      : [true, false, false],
                  selectedSubType: buildingType == "Apartment, Duplex"
                      ? "Apartment"
                      : "Stand Alone",
                ),
                context);
          }

          emit(Page1Success(value));
          // GetFavoritesCubit.get(context).userGetFavorites(token);

        } else {
          print(value);
          emit(Page1Error(value.toString()));
        }
      });
    } catch (e) {
      emit(Page1Error(e.toString()));
    }
  }
}
