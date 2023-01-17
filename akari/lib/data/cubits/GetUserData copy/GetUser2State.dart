part of 'GetUser2Cubit.dart';

@immutable
abstract class GetUser2State {}

class GetUser2Initial extends GetUser2State {}

class GetUser2Loading extends GetUser2State {}

class GetUser2Success extends GetUser2State {
  final GetUserDataModel myGetUser2Model;
  GetUser2Success(this.myGetUser2Model);
}

class GetUser2Error extends GetUser2State {
  final String error;
  GetUser2Error(this.error);
}
