part of 'GetFavoritesCubit.dart';

@immutable
abstract class GetFavoritesState {}

class GetFavoritesInitial extends GetFavoritesState {}

class GetFavoritesLoading extends GetFavoritesState {}

class GetFavoritesSuccess extends GetFavoritesState {
  final GetFavoritesModel myGetFavoritesModel;
  GetFavoritesSuccess(this.myGetFavoritesModel);
}

class GetFavoritesError extends GetFavoritesState {
  final String error;
  GetFavoritesError(this.error);
}
