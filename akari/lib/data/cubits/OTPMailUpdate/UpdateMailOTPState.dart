part of 'UpdateMailOTPCubit.dart';

@immutable
abstract class UpdateMailOTPState {}

class UpdateMailOTPInitial extends UpdateMailOTPState {}

class UpdateMailOTPLoading extends UpdateMailOTPState {}

class UpdateMailOTPSuccess extends UpdateMailOTPState {
  final myUpdateMailOTPModel;
  UpdateMailOTPSuccess(this.myUpdateMailOTPModel);
}

class UpdateMailOTPError extends UpdateMailOTPState {
  final String error;
  UpdateMailOTPError(this.error);
}
