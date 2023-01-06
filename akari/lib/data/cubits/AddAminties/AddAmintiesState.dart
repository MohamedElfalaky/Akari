part of 'AddAmintiesCubit.dart';

@immutable
abstract class AddAmintiesState {}

class AddAmintiesInitial extends AddAmintiesState {}

class AddAmintiesLoading extends AddAmintiesState {}

class AddAmintiesSuccess extends AddAmintiesState {
  final myAddAmintiesModel;
  AddAmintiesSuccess(this.myAddAmintiesModel);
}

class AddAmintiesError extends AddAmintiesState {
  final String error;
  AddAmintiesError(this.error);
}
