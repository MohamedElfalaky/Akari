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

  void userAllAdds(
      {required List<String> contractType,
      required List<String> buildingType,
      required int priceFrom,
      required int priceTo,
      required int page,
      required int limit,
      required List<double> location,
      required int maxDistance,
      required String currency}) {
    try {
      emit(AllAddsLoading());
      allAddsRepo
          .allAdds(
              contractType: contractType,
              buildingType: buildingType,
              priceFrom: priceFrom,
              priceTo: priceTo,
              page: page,
              limit: limit,
              location: location,
              maxDistance: maxDistance,
              currency: currency)
          .then((value) {
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
