import 'dart:math';

import 'package:akari/data/Models/AllAddsModel.dart';
import 'package:akari/data/Repositries/AllAddsRepo.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'SearchFromHomeState.dart';

class SearchFromHomeCubit extends Cubit<SearchFromHomeState> {
  SearchFromHomeCubit() : super(SearchFromHomeInitial());

  static SearchFromHomeCubit get(context) => BlocProvider.of(context);
  AllAddsRepo allAddsRepoRepo = AllAddsRepo();

  void userSearchFromHome(
      {required String myState, required BuildContext context}) {
    try {
      emit(SearchFromHomeLoading());
      allAddsRepoRepo.adsByState(myState: myState).then((value) {
        if (value != null) {
          emit(SearchFromHomeSuccess(value));
          myApplication.navigateTo(AfterFilterAndSearch("title"), context);
        } else {
          print(value);
          emit(SearchFromHomeError(value.toString()));
        }
      });
    } catch (e) {
      emit(SearchFromHomeError(e.toString()));
    }
  }

  /////////////////
  void userConfirmFilter(
      {required String myState,
      required List<String> contractType,
      required List<String> buildingType,
      required String priceFrom,
      required String priceTo,
      required BuildContext context}) {
    try {
      emit(SearchFromHomeLoading());
      allAddsRepoRepo
          .adsByFilter(
              myState: myState,
              contractType: contractType,
              propertyType: buildingType,
              initialPrice: priceFrom,
              finalPrice: priceTo)
          .then((value) {
        if (value != null) {
          emit(SearchFromHomeSuccess(value));
          myApplication.navigateTo(AfterFilterAndSearch("title"), context);
        } else {
          print(value);
          emit(SearchFromHomeError(value.toString()));
        }
      });
    } catch (e) {
      emit(SearchFromHomeError(e.toString()));
    }
  }
}
