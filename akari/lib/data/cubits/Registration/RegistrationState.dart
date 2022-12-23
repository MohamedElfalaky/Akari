part of 'RegistrationCubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final RegisterModel myRegistrationModel;
  RegistrationSuccess(this.myRegistrationModel);
}

class RegistrationError extends RegistrationState {
  final String error;
  RegistrationError(this.error);
}

class PasswordShowen extends RegistrationState {}
