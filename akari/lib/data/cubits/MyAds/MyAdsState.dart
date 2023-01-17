part of 'MyAdsCubit.dart';

@immutable
abstract class MyAdsState {}

class MyAdsInitial extends MyAdsState {}

class MyAdsLoading extends MyAdsState {}

class MyAdsSuccess extends MyAdsState {
  final MyAdsModel myMyAdsModel;
  MyAdsSuccess(this.myMyAdsModel);
}

class MyAdsError extends MyAdsState {
  final String error;
  MyAdsError(this.error);
}
