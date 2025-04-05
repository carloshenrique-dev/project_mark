import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../data/repositories/weather_repository_impl.dart';
import '../data/services/weather_service.dart';
import '../domain/boundary/repositories/weather_repository.dart';
import '../presentation/controllers/weather_controller.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // External
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Services
  getIt.registerLazySingleton<IWeatherService>(
    () => WeatherService(client: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<IWeatherRepository>(
    () => WeatherRepository(getIt()),
  );

  // Controllers
  getIt.registerSingleton<WeatherController>(WeatherController(getIt()));
}
