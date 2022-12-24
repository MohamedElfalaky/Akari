part of 'VarifayOtpCubit.dart';

@immutable
abstract class VarifayOtpState {}

class VarifayOtpInitial extends VarifayOtpState {}

class VarifayOtpLoading extends VarifayOtpState {}

class VarifayOtpSuccess extends VarifayOtpState {
  final VarifyOtpModel myVarifayOtpModel;
  VarifayOtpSuccess(this.myVarifayOtpModel);
}

class VarifayOtpError extends VarifayOtpState {
  final String error;
  VarifayOtpError(this.error);
}
