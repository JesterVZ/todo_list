import 'package:get_it/get_it.dart';
import 'package:todo_list/domain/repository/local/shared_preferences_repository.dart';

final locator = GetIt.instance;

Future<void> startup() async {
  locator.registerLazySingleton<SharedPreferencesRepository>(() => SharedPreferencesRepositoryImpl());
}