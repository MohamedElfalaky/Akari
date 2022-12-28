part of 'GetMassagesCubit.dart';

@immutable
abstract class GetMassagesState {}

class GetMassagesInitial extends GetMassagesState {}

class GetMassagesLoading extends GetMassagesState {}

class GetMassagesSuccess extends GetMassagesState {
  final GetMassageModel myGetMassagesModel;
  GetMassagesSuccess(this.myGetMassagesModel);
}

class GetMassagesError extends GetMassagesState {
  final String error;
  GetMassagesError(this.error);
}

class PasswordShowen extends GetMassagesState {}
