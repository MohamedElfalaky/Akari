part of 'AddToFavoriteCubit.dart';

@immutable
abstract class AddToFavoriteState {}

class AddToFavoriteInitial extends AddToFavoriteState {}

class AddToFavoriteLoading extends AddToFavoriteState {}

class AddToFavoriteSuccess extends AddToFavoriteState {
  final AddToFavoriteModel myAddToFavoriteModel;
  AddToFavoriteSuccess(this.myAddToFavoriteModel);
}

class AddToFavoriteError extends AddToFavoriteState {
  final String error;
  AddToFavoriteError(this.error);
}
