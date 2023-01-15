part of 'GetUserDataCubit.dart';

@immutable
abstract class GetUserDataState {}

class GetUserDataInitial extends GetUserDataState {}

class GetUserDataLoading extends GetUserDataState {}

class GetUserDataSuccess extends GetUserDataState {
  final GetUserDataModel myGetUserDataModel;
  GetUserDataSuccess(this.myGetUserDataModel);
}

class GetUserDataError extends GetUserDataState {
  final String error;
  GetUserDataError(this.error);
}
