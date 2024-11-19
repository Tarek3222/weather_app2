import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/services/api_services.dart';

class MyRepo {
  final ApiServices apiServices;

  MyRepo(this.apiServices);

  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather({
    required String city,
  }) async {
    try {
      CurrentWeatherModel currentWeatherModel =
          await apiServices.getCurrentWeather(city: city);
      return Right(currentWeatherModel);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
