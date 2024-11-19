import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/home/data/repos/my_repo.dart';
import 'package:weather_app/features/home/data/services/api_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      createAndSetupDio(),
    ),
  );
  getIt.registerSingleton<MyRepo>(
    MyRepo(
      getIt.get<ApiServices>(),
    ),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
