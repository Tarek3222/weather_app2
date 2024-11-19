part of 'get_current_weather_cubit.dart';

@immutable
sealed class GetCurrentWeatherState {}

final class GetCurrentWeatherInitial extends GetCurrentWeatherState {}

final class GetCurrentWeatherLoading extends GetCurrentWeatherState {}

final class GetCurrentWeatherSuccess extends GetCurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;

  GetCurrentWeatherSuccess({required this.currentWeatherModel});
}

final class GetCurrentWeatherError extends GetCurrentWeatherState {
  final String errorMessage;

  GetCurrentWeatherError({required this.errorMessage});
}
