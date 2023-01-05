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
part 'RemoveFromFavoriteState.dart';

class RemoveFromFavoriteCubit extends Cubit<RemoveFromFavoriteState> {
  RemoveFromFavoriteCubit() : super(RemoveFromFavoriteInitial());

  static RemoveFromFavoriteCubit get(context) => BlocProvider.of(context);
  AddFavoriteRepo removeFromFavoriteRepo = AddFavoriteRepo();

  void userRemoveFromFavorite(String advertisementId, String token, context) {
    try {
      emit(RemoveFromFavoriteLoading());
      removeFromFavoriteRepo
          .removeFavorite(advertisementId, token)
          .then((value) {
        if (value != null) {
          emit(RemoveFromFavoriteSuccess(value));
          GetFavoritesCubit.get(context).userGetFavorites(token);
        } else {
          print(value);
          emit(RemoveFromFavoriteError(value.toString()));
        }
      });
    } catch (e) {
      emit(RemoveFromFavoriteError(e.toString()));
    }
  }
}
