import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: 'https://api.weatherapi.com/v1/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET('/forecast.json')
  Future<CurrentWeatherModel> getCurrentWeather({
    @Query('key') String key = '5b0a1dab9e2541e7bbf90101242910',
    @Query('q') required String city,
    @Query('days') int days = 10,
    @Query('aqi') String aqi = 'yes',
  });
}
