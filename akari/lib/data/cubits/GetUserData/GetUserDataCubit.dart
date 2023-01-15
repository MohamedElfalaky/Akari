import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Repositries/GetUserDataRepo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'GetUserDataState.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());

  static GetUserDataCubit get(context) => BlocProvider.of(context);
  GetUserDataRepo getUserDataRepo = GetUserDataRepo();

  void userGetUserData({
    required String userId,
    required String token,
  }) {
    try {
      emit(GetUserDataLoading());
      getUserDataRepo.getUserData(userID: userId, token: token).then((value) {
        if (value != null) {
          emit(GetUserDataSuccess(value));
        } else {
          print(value);
          emit(GetUserDataError(value.toString()));
        }
      });
    } catch (e) {
      emit(GetUserDataError(e.toString()));
    }
  }
}
