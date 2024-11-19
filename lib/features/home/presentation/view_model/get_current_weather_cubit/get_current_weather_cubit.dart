// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/repos/my_repo.dart';

part 'get_current_weather_state.dart';

class GetCurrentWeatherCubit extends Cubit<GetCurrentWeatherState> {
  GetCurrentWeatherCubit(this.myRepo) : super(GetCurrentWeatherInitial());
  final MyRepo myRepo;
  late CurrentWeatherModel currentWeatherModel;
  Future<void> getCurrentWeather({required String city}) async {
    emit(GetCurrentWeatherLoading());
    final response = await myRepo.getCurrentWeather(city: city);
    response.fold(
        (failure) =>
            emit(GetCurrentWeatherError(errorMessage: failure.message)),
        (currentWeather) {
      currentWeatherModel = currentWeather;
      emit(GetCurrentWeatherSuccess(currentWeatherModel: currentWeather));
    });
  }
}
