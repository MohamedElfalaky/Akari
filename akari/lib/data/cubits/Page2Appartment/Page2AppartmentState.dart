part of 'Page2AppartmentCubit.dart';

@immutable
abstract class Page2AppartmentState {}

class Page2AppartmentInitial extends Page2AppartmentState {}

class Page2AppartmentLoading extends Page2AppartmentState {}

class Page2AppartmentSuccess extends Page2AppartmentState {
  final Page2AppartmentModel myPage2AppartmentModel;
  Page2AppartmentSuccess(this.myPage2AppartmentModel);
}

class Page2AppartmentError extends Page2AppartmentState {
  final String error;
  Page2AppartmentError(this.error);
}
