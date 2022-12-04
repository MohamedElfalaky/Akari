import 'dart:math';

import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Repositries/LoginRepo.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/helpers/dio_helper.dart';
import 'package:akari/App/constants.dart';
import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo logInRepo = LoginRepo();

  bool isHiddenPass = true;
  Widget? securityIcon = SvgPicture.asset(passOff);

  void userLogin({required String mail, required String password}) {
    try {
      emit(LoginLoading());
      logInRepo.logIn(mail, password).then((value) {
        if (value != null) {
          emit(LoginSuccess(value));
        } else {
          LoginError(value.toString());
        }
      });
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = SvgPicture.asset(passOff)
        : securityIcon = SvgPicture.asset(passOn);
    emit(PasswordShowen());
  }
}
