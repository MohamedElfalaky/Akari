import 'dart:math';

import 'package:akari/data/Models/varify_otp/varify_otp.dart';
import 'package:akari/data/Repositries/VarifayOtpRepo.dart';

import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'VarifayOtpState.dart';

class VarifayOtpCubit extends Cubit<VarifayOtpState> {
  VarifayOtpCubit() : super(VarifayOtpInitial());

  static VarifayOtpCubit get(context) => BlocProvider.of(context);
  VarifayOtpRepo varifayOtpRepo = VarifayOtpRepo();

  bool isHiddenPass = true;
  Widget? securityIcon = SvgPicture.asset(passOff);

  void userVarifayOtp({required String mail, required String OTP}) {
    try {
      emit(VarifayOtpLoading());
      varifayOtpRepo.VarifayOtp(mail, OTP).then((value) {
        if (value != null) {
          emit(VarifayOtpSuccess(value));
        } else {
          emit(VarifayOtpError(value.toString()));
          print(value);
        }
      });
    } catch (e) {
      emit(VarifayOtpError(e.toString()));
    }
  }
}
