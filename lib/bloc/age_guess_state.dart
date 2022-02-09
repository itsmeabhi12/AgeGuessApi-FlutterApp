import 'package:jsonplaceholder/model/user.dart';

abstract class AgeGuessState {}

class Empty extends AgeGuessState {}

class Loading extends AgeGuessState {}

class Loaded extends AgeGuessState {
  final User user;
  Loaded(this.user);
}

class Failure extends AgeGuessState {
  final String message;
  Failure(this.message);
}
