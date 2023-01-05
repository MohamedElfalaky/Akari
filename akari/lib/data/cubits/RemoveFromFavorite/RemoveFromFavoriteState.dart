part of 'RemoveFromFavoriteCubit.dart';

@immutable
abstract class RemoveFromFavoriteState {}

class RemoveFromFavoriteInitial extends RemoveFromFavoriteState {}

class RemoveFromFavoriteLoading extends RemoveFromFavoriteState {}

class RemoveFromFavoriteSuccess extends RemoveFromFavoriteState {
  final AddToFavoriteModel myRemoveFromFavoriteModel;
  RemoveFromFavoriteSuccess(this.myRemoveFromFavoriteModel);
}

class RemoveFromFavoriteError extends RemoveFromFavoriteState {
  final String error;
  RemoveFromFavoriteError(this.error);
}
