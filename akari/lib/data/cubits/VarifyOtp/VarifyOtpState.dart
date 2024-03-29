part of 'VarifyOtpCubit.dart';

@immutable
abstract class VarifyOtpState {}

class VarifyOtpInitial extends VarifyOtpState {}

class VarifyOtpLoading extends VarifyOtpState {}

class VarifyOtpSuccess extends VarifyOtpState {
  final VarifyOtp2 myVarifyOtpModel;
  VarifyOtpSuccess(this.myVarifyOtpModel);
}

class VarifyOtpError extends VarifyOtpState {
  final String error;
  VarifyOtpError(this.error);
}
