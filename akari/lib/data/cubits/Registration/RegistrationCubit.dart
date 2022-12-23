import 'dart:math';

import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Models/register_model/register_model.dart';
import 'package:akari/data/Repositries/LoginRepo.dart';
import 'package:akari/data/Repositries/RegisterRepo.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
part 'RegistrationState.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context) => BlocProvider.of(context);
  RegisterRepo registerRepo = RegisterRepo();

  bool isHiddenPass1 = true;
  bool isHiddenPass2 = true;
  Widget? securityIcon1 = SvgPicture.asset(passOff);
  Widget? securityIcon2 = SvgPicture.asset(passOff);

  void userRegistration(
      {required String name,
      required String mail,
      required String password,
      required String phone}) {
    try {
      emit(RegistrationLoading());
      registerRepo.register(name, mail, password, phone).then((value) {
        if (value != null) {
          emit(RegistrationSuccess(value));
        } else {
          emit(RegistrationError(value.toString()));
        }
      });
    } catch (e) {
      emit(RegistrationError(e.toString()));
    }
  }

  void showPassWord1() {
    isHiddenPass1 = !isHiddenPass1;

    isHiddenPass1
        ? securityIcon1 = SvgPicture.asset(passOff)
        : securityIcon1 = SvgPicture.asset(passOn);
    emit(PasswordShowen());
  }

  void showPassWord2() {
    isHiddenPass2 = !isHiddenPass2;

    isHiddenPass2
        ? securityIcon2 = SvgPicture.asset(passOff)
        : securityIcon2 = SvgPicture.asset(passOn);
    emit(PasswordShowen());
  }
}
