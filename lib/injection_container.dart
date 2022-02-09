import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder/Repository/remote_repo.dart';
import 'package:jsonplaceholder/Repository/repo.dart';
import 'package:jsonplaceholder/bloc/age_guess_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => AgeGuessBloc(repository: sl()));

  sl.registerLazySingleton(() => Repository(sl()));

  sl.registerLazySingleton(() => RemoteRepository(sl()));

  sl.registerLazySingleton(() => http.Client());
}
