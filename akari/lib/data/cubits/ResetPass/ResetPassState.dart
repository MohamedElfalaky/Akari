part of 'ResetPassCubit.dart';

@immutable
abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {
  final ResetPassModel myResetPassModel;
  ResetPassSuccess(this.myResetPassModel);
}

class ResetPassError extends ResetPassState {
  final String error;
  ResetPassError(this.error);
}

class PasswordShowen extends ResetPassState {}
