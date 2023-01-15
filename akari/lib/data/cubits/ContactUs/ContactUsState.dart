part of 'ContactUsCubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {
  final myContactUsModel;
  ContactUsSuccess(this.myContactUsModel);
}

class ContactUsError extends ContactUsState {
  final String error;
  ContactUsError(this.error);
}
