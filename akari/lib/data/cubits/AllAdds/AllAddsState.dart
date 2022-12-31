part of 'AllAddsCubit.dart';

@immutable
abstract class AllAddsState {}

class AllAddsInitial extends AllAddsState {}

class AllAddsLoading extends AllAddsState {}

class AllAddsSuccess extends AllAddsState {
  final AllAddsModel myAllAddsModel;
  AllAddsSuccess(this.myAllAddsModel);
}

class AllAddsError extends AllAddsState {
  final String error;
  AllAddsError(this.error);
}
