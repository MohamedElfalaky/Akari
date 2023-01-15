import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'UpdateUserState.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);
  UpdateUserRepo updateUserRepo = UpdateUserRepo();

  void userUpdateUser(
      {required String currentPass,
      required String newPass,
      required String token}) {
    try {
      emit(UpdateUserLoading());
      updateUserRepo
          .updatePassword(
              currentPass: currentPass, newPass: newPass, token: token)
          .then((value) {
        if (value != null) {
          emit(UpdateUserSuccess(value));
        } else {
          print(value);
          emit(UpdateUserError(value.toString()));
        }
      });
    } catch (e) {
      emit(UpdateUserError(e.toString()));
    }
  }
}
