part of 'Page2VillaCubit.dart';

@immutable
abstract class Page2VillaState {}

class Page2VillaInitial extends Page2VillaState {}

class Page2VillaLoading extends Page2VillaState {}

class Page2VillaSuccess extends Page2VillaState {
  final Page2VillaModel myPage2VillaModel;
  Page2VillaSuccess(this.myPage2VillaModel);
}

class Page2VillaError extends Page2VillaState {
  final String error;
  Page2VillaError(this.error);
}
