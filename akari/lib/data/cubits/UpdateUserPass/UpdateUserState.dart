part of 'UpdateUserCubit.dart';

@immutable
abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final myUpdateUserModel;
  UpdateUserSuccess(this.myUpdateUserModel);
}

class UpdateUserError extends UpdateUserState {
  final String error;
  UpdateUserError(this.error);
}
