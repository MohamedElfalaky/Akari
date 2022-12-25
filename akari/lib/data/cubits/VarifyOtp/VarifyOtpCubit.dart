import 'dart:math';

import 'package:akari/data/Models/varify_otp2/varify_otp2.dart';
import 'package:akari/data/Repositries/VarifyOtpRepo.dart';

import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'VarifyOtpState.dart';

class VarifyOtpCubit extends Cubit<VarifyOtpState> {
  VarifyOtpCubit() : super(VarifyOtpInitial());

  static VarifyOtpCubit get(context) => BlocProvider.of(context);
  VarifyOtpRepo varifyOtpRepo = VarifyOtpRepo();

  void userVarifyOtp({required String mail, required int otp}) {
    try {
      emit(VarifyOtpLoading());
      varifyOtpRepo.varifyOtp(mail, otp).then((value) {
        if (value != null) {
          emit(VarifyOtpSuccess(value));
          print(value);
        } else {
          emit(VarifyOtpError(value.toString()));
          print(value);
        }
      });
    } catch (e) {
      emit(VarifyOtpError(e.toString()));
    }
  }
}
