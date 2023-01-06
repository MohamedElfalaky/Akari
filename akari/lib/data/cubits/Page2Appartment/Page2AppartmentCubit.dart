import 'dart:math';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Models/page1_model/page1_model.dart';
import 'package:akari/data/Models/page2_appartment_model/page2_appartment_model.dart';
import 'package:akari/data/Repositries/AddAdvertiseRepo.dart';
import 'package:akari/data/Repositries/AddFavoriteRepo.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page2/P2Villa&Appartment.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page3/FormPage3.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'Page2AppartmentState.dart';

class Page2AppartmentCubit extends Cubit<Page2AppartmentState> {
  Page2AppartmentCubit() : super(Page2AppartmentInitial());

  static Page2AppartmentCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo Page2AppartmentRepo = AddAdvertiseRepo();

  void userPage2Appartment(
      String title,
      String subType,
      int area,
      int bedroomsCount,
      int bathroomCount,
      int floor,
      String deliveryTerm,
      String renterType,
      List<String> rentFrequency,
      String description,
      String id,
      String token,
      String catigory,
      context) {
    try {
      emit(Page2AppartmentLoading());
      Page2AppartmentRepo.Page2Appartment(
              title,
              subType,
              area,
              bedroomsCount,
              bathroomCount,
              floor,
              deliveryTerm,
              renterType,
              rentFrequency,
              description,
              id,
              token)
          .then((value) {
        if (value != null) {
          myApplication.navigateTo(
              FormPage3(id: id, category: catigory), context);

          emit(Page2AppartmentSuccess(value));
        } else {
          print(value);
          emit(Page2AppartmentError(value.toString()));
        }
      });
    } catch (e) {
      emit(Page2AppartmentError(e.toString()));
    }
  }
}
