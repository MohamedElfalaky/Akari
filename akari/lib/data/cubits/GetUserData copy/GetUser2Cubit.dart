import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Repositries/GetUserDataRepo.dart';
import 'package:akari/data/cubits/GetRooms/GetRoomsCubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'GetUser2State.dart';

class GetUser2Cubit extends Cubit<GetUser2State> {
  GetUser2Cubit() : super(GetUser2Initial());

  static GetUser2Cubit get(context) => BlocProvider.of(context);
  GetUserDataRepo getUser2Repo = GetUserDataRepo();
  var calls;

  void userGetUser2(
      {required String userId, required String token, required context}) {
    try {
      emit(GetUser2Loading());
      getUser2Repo.getUserData(userID: userId, token: token).then((value) {
        if (value != null) {
          calls = value.data!.numberOfCalls;

          emit(GetUser2Success(value));
          ////
          ///
          ///
          // GetRoomsCubit.get(context).userGetRooms(token: token);

          ///
          ///
          ///

        } else {
          print(value);
          emit(GetUser2Error(value.toString()));
        }
      });
    } catch (e) {
      emit(GetUser2Error(e.toString()));
    }
  }
}
