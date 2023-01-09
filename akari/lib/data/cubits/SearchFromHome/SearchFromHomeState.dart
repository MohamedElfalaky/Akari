part of 'SearchFromHomeCubit.dart';

@immutable
abstract class SearchFromHomeState {}

class SearchFromHomeInitial extends SearchFromHomeState {}

class SearchFromHomeLoading extends SearchFromHomeState {}

class SearchFromHomeSuccess extends SearchFromHomeState {
  final AllAddsModel mySearchFromHomeModel;
  SearchFromHomeSuccess(this.mySearchFromHomeModel);
}

class SearchFromHomeError extends SearchFromHomeState {
  final String error;
  SearchFromHomeError(this.error);
}
