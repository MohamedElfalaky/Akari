import 'dart:math';

import 'package:akari/data/Models/get_massage_model/get_massage_model.dart';
import 'package:akari/data/Repositries/GetMassagesRepo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'GetMassagesState.dart';

class GetMassagesCubit extends Cubit<GetMassagesState> {
  GetMassagesCubit() : super(GetMassagesInitial());

  static GetMassagesCubit get(context) => BlocProvider.of(context);
  GetMassagesRepo getMassagesRepo = GetMassagesRepo();

  void userGetMassages({required String token, required String roomId}) {
    try {
      emit(GetMassagesLoading());
      getMassagesRepo.getMassages(token, roomId).then((value) {
        if (value != null) {
          emit(GetMassagesSuccess(value));
        } else {
          print(value);
          emit(GetMassagesError(value.toString()));
        }
      });
    } catch (e) {
      emit(GetMassagesError(e.toString()));
    }
  }
}
