import 'dart:math';

import 'package:akari/data/Models/reset_pass_model.dart';

import 'package:akari/data/Repositries/RestPassRepo.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
part 'ResetPassState.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit() : super(ResetPassInitial());

  static ResetPassCubit get(context) => BlocProvider.of(context);
  ResetPassRepo resetPassRepo = ResetPassRepo();

  void userResetPass({required String password, required String token}) {
    try {
      emit(ResetPassLoading());
      resetPassRepo.resetPass(password, token).then((value) {
        if (value != null) {
          emit(ResetPassSuccess(value));
        } else {
          print(value);
          emit(ResetPassError(value.toString()));
        }
      });
    } catch (e) {
      emit(ResetPassError(e.toString()));
    }
  }
}
