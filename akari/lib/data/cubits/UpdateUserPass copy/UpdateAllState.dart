part of 'UpdateAllCubit.dart';

@immutable
abstract class updateAllState {}

class updateAllInitial extends updateAllState {}

class updateAllLoading extends updateAllState {}

class updateAllSuccess extends updateAllState {
  final myupdateAllModel;
  updateAllSuccess(this.myupdateAllModel);
}

class updateAllError extends updateAllState {
  final String error;
  updateAllError(this.error);
}
