import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Models/resend_otp/otp.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/OTP.dart';
import 'package:akari/presentation/screens/ProfilePage/components/UpdateMailOTP.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'UpdateUserMailState.dart';

class UpdateUserMailCubit extends Cubit<UpdateUserMailState> {
  UpdateUserMailCubit() : super(UpdateUserMailInitial());

  static UpdateUserMailCubit get(context) => BlocProvider.of(context);
  UpdateUserRepo updateUserRepo = UpdateUserRepo();

  void userUpdateUserMail(
      {required String newMail, required String token, required context}) {
    try {
      emit(UpdateUserMailLoading());
      updateUserRepo.updateMail(newEmail: newMail, token: token).then((value) {
        if (value != null) {
          emit(UpdateUserMailSuccess(value));
          // GetUserDataCubit.get(context).userGetUserData(
          //     userId: CacheHelper.getFromShared("id"),
          //     token: CacheHelper.getFromShared("token"));
          myApplication.navigateTo(
              UpdateMailOTP(
                userMail: newMail,
              ),
              context);
        } else {
          print(value);
          emit(UpdateUserMailError(value.toString()));
        }
      });
    } catch (e) {
      emit(UpdateUserMailError(e.toString()));
    }
  }
}
