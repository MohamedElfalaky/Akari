import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/More.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'UpdateAllState.dart';

class updateAllCubit extends Cubit<updateAllState> {
  updateAllCubit() : super(updateAllInitial());

  static updateAllCubit get(context) => BlocProvider.of(context);
  UpdateUserRepo updateAllRepo = UpdateUserRepo();

  void userupdateAll(
      {required String name,
      required String phone,
      required String about,
      required String token,
      required context}) {
    try {
      emit(updateAllLoading());
      updateAllRepo
          .updateAll(name: name, phone: phone, about: about, token: token)
          .then((value) {
        if (value != null) {
          myApplication.navigateToReplace(More(), context);
          emit(updateAllSuccess(value));
        } else {
          print(value);
          emit(updateAllError(value.toString()));
        }
      });
    } catch (e) {
      emit(updateAllError(e.toString()));
    }
  }
}
