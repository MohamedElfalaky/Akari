part of 'AddPriceCubit.dart';

@immutable
abstract class AddPriceState {}

class AddPriceInitial extends AddPriceState {}

class AddPriceLoading extends AddPriceState {}

class AddPriceSuccess extends AddPriceState {
  final myAddPriceModel;
  AddPriceSuccess(this.myAddPriceModel);
}

class AddPriceError extends AddPriceState {
  final String error;
  AddPriceError(this.error);
}
