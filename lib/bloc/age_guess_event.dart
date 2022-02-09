abstract class AgeGuessEvent {}

class GuessMyAge extends AgeGuessEvent {
  final String name;
  GuessMyAge(this.name);
}
