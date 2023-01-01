import 'dart:math';

import 'package:akari/data/Models/AllAddsModel.dart';
import 'package:akari/data/Models/get_favorites_model/get_favorites_model.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/data/Repositries/GetFavoritesRepo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'GetFavoritesState.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  GetFavoritesCubit() : super(GetFavoritesInitial());

  static GetFavoritesCubit get(context) => BlocProvider.of(context);
  GetFavoritesRepo getFavoritesRepo = GetFavoritesRepo();

  void userGetFavorites(dynamic token) {
    try {
      emit(GetFavoritesLoading());
      getFavoritesRepo.getFavorites(token).then((value) {
        if (value != null) {
          emit(GetFavoritesSuccess(value));
        } else {
          print(value);
          emit(GetFavoritesError(value.toString()));
        }
      });
    } catch (e) {
      emit(GetFavoritesError(e.toString()));
    }
  }
}
