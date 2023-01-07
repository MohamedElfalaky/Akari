import 'dart:math';

import 'package:akari/data/Models/AllAddsModel.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'AllAddsState.dart';

class AllAddsCubit extends Cubit<AllAddsState> {
  AllAddsCubit() : super(AllAddsInitial());

  static AllAddsCubit get(context) => BlocProvider.of(context);
  AllAddsRepo allAddsRepo = AllAddsRepo();

  void userAllAdds() {
    try {
      emit(AllAddsLoading());
      allAddsRepo.allAdds().then((value) {
        if (value != null) {
          emit(AllAddsSuccess(value));
        } else {
          print(value);
          emit(AllAddsError(value.toString()));
        }
      });
    } catch (e) {
      emit(AllAddsError(e.toString()));
    }
  }
}
