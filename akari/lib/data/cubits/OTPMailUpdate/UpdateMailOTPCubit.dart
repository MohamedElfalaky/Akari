import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/More.dart';
import 'package:akari/presentation/screens/ProfilePage/ProfilePage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'UpdateMailOTPState.dart';

class UpdateMailOTPCubit extends Cubit<UpdateMailOTPState> {
  UpdateMailOTPCubit() : super(UpdateMailOTPInitial());

  static UpdateMailOTPCubit get(context) => BlocProvider.of(context);
  UpdateUserRepo updateUserRepo = UpdateUserRepo();

  void userUpdateMailOTP(
      {required String otp, required String token, required context}) {
    try {
      emit(UpdateMailOTPLoading());
      updateUserRepo.updateMailOTP(otp: otp, token: token).then((value) {
        if (value != null) {
          emit(UpdateMailOTPSuccess(value));
          myApplication.navigateToReplace(More(), context);
        } else {
          print(value);
          emit(UpdateMailOTPError(value.toString()));
        }
      });
    } catch (e) {
      emit(UpdateMailOTPError(e.toString()));
    }
  }
}
