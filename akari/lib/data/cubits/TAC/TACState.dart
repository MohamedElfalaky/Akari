part of 'TACCubit.dart';

@immutable
abstract class TACState {}

class TACInitial extends TACState {}

class TACLoading extends TACState {}

class TACSuccess extends TACState {
  final TacModel myTACModel;
  TACSuccess(this.myTACModel);
}

class TACError extends TACState {
  final String error;
  TACError(this.error);
}
