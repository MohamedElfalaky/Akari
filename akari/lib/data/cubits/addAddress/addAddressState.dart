part of 'AddAmintiesCubit.dart';

@immutable
abstract class addAddressState {}

class addAddressInitial extends addAddressState {}

class addAddressLoading extends addAddressState {}

class addAddressSuccess extends addAddressState {
  final myaddAddressModel;
  addAddressSuccess(this.myaddAddressModel);
}

class addAddressError extends addAddressState {
  final String error;
  addAddressError(this.error);
}
