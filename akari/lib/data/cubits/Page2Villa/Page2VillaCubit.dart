import 'dart:math';

import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Models/page1_model/page1_model.dart';
import 'package:akari/data/Models/page2_appartment_model/page2_appartment_model.dart';
import 'package:akari/data/Models/page2_villa_model/page2_villa_model.dart';
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
part 'Page2VillaState.dart';

class Page2VillaCubit extends Cubit<Page2VillaState> {
  Page2VillaCubit() : super(Page2VillaInitial());

  static Page2VillaCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo Page2VillaRepo = AddAdvertiseRepo();

  void userPage2Villa(
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
      emit(Page2VillaLoading());
      Page2VillaRepo.Page2Villa(
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
        token,
      ).then((value) {
        if (value != null) {
          myApplication.navigateTo(
              FormPage3(id: id, category: catigory), context);

          emit(Page2VillaSuccess(value));
        } else {
          print(value);
          emit(Page2VillaError(value.toString()));
        }
      });
    } catch (e) {
      emit(Page2VillaError(e.toString()));
    }
  }
}
