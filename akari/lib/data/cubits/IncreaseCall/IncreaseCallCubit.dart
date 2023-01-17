import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Models/tac_model/tac_model.dart';
import 'package:akari/data/Repositries/IncreaseCall.dart';
import 'package:akari/data/Repositries/TACRepo.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/More.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'IncreaseCallState.dart';

class IncreaseCallCubit extends Cubit<IncreaseCallState> {
  IncreaseCallCubit() : super(IncreaseCallInitial());

  static IncreaseCallCubit get(context) => BlocProvider.of(context);
  IncreaseCallRepo increaseCallRepo = IncreaseCallRepo();

  void userIncreaseCall({
    required context,
    // required String userId,
    required String advertiserId,
    required String token,
    required String userId,
  }) {
    try {
      emit(IncreaseCallLoading());
      increaseCallRepo
          .increaseCall(advertiserId: advertiserId, token: token)
          .then((value) {
        if (value != null) {
          GetUserDataCubit.get(context)
              .userGetUserData(token: token, userId: userId);
          emit(IncreaseCallSuccess(value));
        } else {
          print(value);
          emit(IncreaseCallError(value.toString()));
        }
      });
    } catch (e) {
      emit(IncreaseCallError(e.toString()));
    }
  }
}
