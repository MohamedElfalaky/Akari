part of 'ForgetPassCubit.dart';

@immutable
abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassSuccess extends ForgetPassState {
  final ForgetPassModel myForgetPassModel;
  ForgetPassSuccess(this.myForgetPassModel);
}

class ForgetPassError extends ForgetPassState {
  final String error;
  ForgetPassError(this.error);
}
