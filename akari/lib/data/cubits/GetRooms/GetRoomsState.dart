part of 'GetRoomsCubit.dart';

@immutable
abstract class GetRoomsState {}

class GetRoomsInitial extends GetRoomsState {}

class GetRoomsLoading extends GetRoomsState {}

class GetRoomsSuccess extends GetRoomsState {
  final GetRoomsModel myGetRoomsModel;
  GetRoomsSuccess(this.myGetRoomsModel);
}

class GetRoomsError extends GetRoomsState {
  final String error;
  GetRoomsError(this.error);
}

class PasswordShowen extends GetRoomsState {}
