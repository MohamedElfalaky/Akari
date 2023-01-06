part of 'Page1Cubit.dart';

@immutable
abstract class Page1State {}

class Page1Initial extends Page1State {}

class Page1Loading extends Page1State {}

class Page1Success extends Page1State {
  final Page1Model myPage1Model;
  Page1Success(this.myPage1Model);
}

class Page1Error extends Page1State {
  final String error;
  Page1Error(this.error);
}
