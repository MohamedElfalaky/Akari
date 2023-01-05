import 'dart:math';

import 'package:akari/data/Models/AllAddsModel.dart';
import 'package:akari/data/Models/add_to_favorite_model.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Repositries/AddFavoriteRepo.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'AddToFavoriteState.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit() : super(AddToFavoriteInitial());

  static AddToFavoriteCubit get(context) => BlocProvider.of(context);
  AddFavoriteRepo addToFavoriteRepo = AddFavoriteRepo();

  void userAddToFavorite(String advertisementId, String token, context) {
    try {
      emit(AddToFavoriteLoading());
      addToFavoriteRepo.addFavorite(advertisementId, token).then((value) {
        if (value != null) {
          emit(AddToFavoriteSuccess(value));
          GetFavoritesCubit.get(context).userGetFavorites(token);
        } else {
          print(value);
          emit(AddToFavoriteError(value.toString()));
        }
      });
    } catch (e) {
      emit(AddToFavoriteError(e.toString()));
    }
  }
}
