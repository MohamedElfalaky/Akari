part of 'ConfirmAddCubit.dart';

@immutable
abstract class ConfirmAddState {}

class ConfirmAddInitial extends ConfirmAddState {}

class ConfirmAddLoading extends ConfirmAddState {}

class ConfirmAddSuccess extends ConfirmAddState {
  final myConfirmAddModel;
  ConfirmAddSuccess(this.myConfirmAddModel);
}

class ConfirmAddError extends ConfirmAddState {
  final String error;
  ConfirmAddError(this.error);
}
