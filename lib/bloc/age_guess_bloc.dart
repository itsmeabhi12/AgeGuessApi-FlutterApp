import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/Failures/api_not_found_exception.dart';
import 'package:jsonplaceholder/Failures/network_error_exception.dart';
import 'package:jsonplaceholder/Repository/repo.dart';
import 'package:jsonplaceholder/bloc/age_guess_event.dart';
import 'package:jsonplaceholder/bloc/age_guess_state.dart';
import 'package:jsonplaceholder/model/user.dart';

class AgeGuessBloc extends Bloc<AgeGuessEvent, AgeGuessState> {
  final Repository repository;
  AgeGuessBloc({required this.repository}) : super(Empty()) {
    on<GuessMyAge>((event, emit) async {
      emit(Loading());
      try {
        final User? user = await repository.getData(event.name);
        emit(Loaded(user!));
      } on NetworkError catch (e) {
        emit(Failure(e.message));
      } on ApiNotFoundException catch (e) {
        emit(Failure(e.message));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
