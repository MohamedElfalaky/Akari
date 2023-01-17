import 'package:akari/data/Models/my_ads_model/my_ads_model.dart';
import 'package:akari/data/Repositries/MyAdsRepo.dart';
import 'package:akari/data/Repositries/UpdateUserRepos.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/More/More.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'MyAdsState.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit() : super(MyAdsInitial());
  int views = 0;
  int ads = 0;
  static MyAdsCubit get(context) => BlocProvider.of(context);
  MyAdsRepo myAdsRepo = MyAdsRepo();

  void userMyAds({required String token, required context}) {
    try {
      emit(MyAdsLoading());
      myAdsRepo.MyAds(token).then((value) {
        if (value != null) {
          // myApplication.navigateToReplace(More(), context);
          for (int i = 0; i < value.data!.length; i++) {
            views = views + value.data![i].views!;
          }
          ads = value.data!.length;
          emit(MyAdsSuccess(value));
        } else {
          print(value);
          emit(MyAdsError(value.toString()));
        }
      });
    } catch (e) {
      emit(MyAdsError(e.toString()));
    }
  }
}
