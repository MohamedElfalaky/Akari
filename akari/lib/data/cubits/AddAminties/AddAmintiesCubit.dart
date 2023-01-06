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
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'AddAmintiesState.dart';

class AddAmintiesCubit extends Cubit<AddAmintiesState> {
  AddAmintiesCubit() : super(AddAmintiesInitial());

  static AddAmintiesCubit get(context) => BlocProvider.of(context);
  AddAdvertiseRepo AddAmintiesRepo = AddAdvertiseRepo();

  void userAddAminties(List<String> amintiesList, String id, String token,
      String category, context) {
    try {
      emit(AddAmintiesLoading());
      AddAmintiesRepo.addAminties(amintiesList, id, token).then((value) {
        if (value != null) {
          myApplication.navigateTo(
              FormPage4(id: id, category: category), context);
          emit(AddAmintiesSuccess(value));
          // GetFavoritesCubit.get(context).userGetFavorites(token);

        } else {
          print(value);
          emit(AddAmintiesError(value.toString()));
        }
      });
    } catch (e) {
      emit(AddAmintiesError(e.toString()));
    }
  }
}
