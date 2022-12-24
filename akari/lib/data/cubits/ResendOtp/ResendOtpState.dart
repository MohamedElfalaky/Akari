part of 'ResendOtpCubit.dart';

@immutable
abstract class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpSuccess extends ResendOtpState {
  final ResendOtpModel myResendOtpModel;
  ResendOtpSuccess(this.myResendOtpModel);
}

class ResendOtpError extends ResendOtpState {
  final String error;
  ResendOtpError(this.error);
}
