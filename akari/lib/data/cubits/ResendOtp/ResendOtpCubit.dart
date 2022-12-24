import 'dart:math';

import 'package:akari/data/Models/resend_otp/resend_otp.dart';
import 'package:akari/data/Models/varify_otp/varify_otp.dart';
import 'package:akari/data/Repositries/ResendOtpRepo.dart';

import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'ResendOtpState.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit() : super(ResendOtpInitial());

  static ResendOtpCubit get(context) => BlocProvider.of(context);
  ResendOtpRepo resendOtpRepo = ResendOtpRepo();

  bool isHiddenPass = true;
  Widget? securityIcon = SvgPicture.asset(passOff);

  void userResendOtp({required String mail}) {
    try {
      emit(ResendOtpLoading());
      resendOtpRepo.resendOtp(mail).then((value) {
        if (value != null) {
          emit(ResendOtpSuccess(value));
        } else {
          emit(ResendOtpError(value.toString()));
          print(value);
        }
      });
    } catch (e) {
      emit(ResendOtpError(e.toString()));
    }
  }
}
