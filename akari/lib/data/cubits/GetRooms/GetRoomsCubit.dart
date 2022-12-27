import 'dart:math';

import 'package:akari/data/Models/get_rooms_model/get_rooms_model.dart';
import 'package:akari/data/Models/reset_pass_model.dart';
import 'package:akari/data/Repositries/GetRoomsRepo.dart';

import 'package:akari/data/Repositries/RestPassRepo.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
part 'GetRoomsState.dart';

class GetRoomsCubit extends Cubit<GetRoomsState> {
  GetRoomsCubit() : super(GetRoomsInitial());

  static GetRoomsCubit get(context) => BlocProvider.of(context);
  GetRoomsRepo getRoomsRepo = GetRoomsRepo();

  void userGetRooms({required String token}) {
    try {
      emit(GetRoomsLoading());
      getRoomsRepo.getRooms(token).then((value) {
        if (value != null) {
          emit(GetRoomsSuccess(value));
        } else {
          print(value);
          emit(GetRoomsError(value.toString()));
        }
      });
    } catch (e) {
      emit(GetRoomsError(e.toString()));
    }
  }
}
