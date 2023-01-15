part of 'UpdateUserMailCubit.dart';

@immutable
abstract class UpdateUserMailState {}

class UpdateUserMailInitial extends UpdateUserMailState {}

class UpdateUserMailLoading extends UpdateUserMailState {}

class UpdateUserMailSuccess extends UpdateUserMailState {
  final myUpdateUserMailModel;
  UpdateUserMailSuccess(this.myUpdateUserMailModel);
}

class UpdateUserMailError extends UpdateUserMailState {
  final String error;
  UpdateUserMailError(this.error);
}
