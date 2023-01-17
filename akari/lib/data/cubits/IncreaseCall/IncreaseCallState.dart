part of 'IncreaseCallCubit.dart';

@immutable
abstract class IncreaseCallState {}

class IncreaseCallInitial extends IncreaseCallState {}

class IncreaseCallLoading extends IncreaseCallState {}

class IncreaseCallSuccess extends IncreaseCallState {
  final myIncreaseCallModel;
  IncreaseCallSuccess(this.myIncreaseCallModel);
}

class IncreaseCallError extends IncreaseCallState {
  final String error;
  IncreaseCallError(this.error);
}
