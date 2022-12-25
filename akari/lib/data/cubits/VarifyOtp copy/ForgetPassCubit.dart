import 'dart:math';

import 'package:akari/data/Models/forget_pass_model.dart';
import 'package:akari/data/Models/varify_otp_model.dart';
import 'package:akari/data/Repositries/ForgetPassRepo.dart';
import 'package:akari/data/Repositries/VarifyOtpRepo.dart';

import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'ForgetPassState.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());

  static ForgetPassCubit get(context) => BlocProvider.of(context);
  ForgetPassRepo forgetPassRepo = ForgetPassRepo();

  void userForgetPass({required String mail}) {
    try {
      emit(ForgetPassLoading());
      forgetPassRepo.forgetPass(mail).then((value) {
        if (value != null) {
          emit(ForgetPassSuccess(value));
          print(value);
        } else {
          emit(ForgetPassError(value.toString()));
          print(value);
        }
      });
    } catch (e) {
      emit(ForgetPassError(e.toString()));
    }
  }
}
