import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Models/tac_model/tac_model.dart';
import 'package:akari/data/Repositries/TACRepo.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/More.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'TACState.dart';

class TACCubit extends Cubit<TACState> {
  TACCubit() : super(TACInitial());

  static TACCubit get(context) => BlocProvider.of(context);
  TACRepo tACRepo = TACRepo();

  void userTAC({
    required String token,
  }) {
    try {
      emit(TACLoading());
      tACRepo.TAC(token).then((value) {
        if (value != null) {
          emit(TACSuccess(value));
        } else {
          print(value);
          emit(TACError(value.toString()));
        }
      });
    } catch (e) {
      emit(TACError(e.toString()));
    }
  }
}
