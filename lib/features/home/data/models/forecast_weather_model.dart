import 'package:weather_app/features/home/data/models/hourly_forecast_model.dart';

class ForecastWeatherModel {
  DateTime? date;
  int? maxTemp;
  int? minTemp;
  int? avgTemp;
  num? maxWind;
  num? avgHumidity;
  num? dailyChanceOfRain;
  String? watherIcon;
  String? weatherStatus;
  num? uv;
  String? sunrise;
  String? sunset;
  List<HourlyForecastModel>? hourlyForecast;

  ForecastWeatherModel(
      {this.date,
      this.maxTemp,
      this.minTemp,
      this.avgTemp,
      this.maxWind,
      this.avgHumidity,
      this.dailyChanceOfRain,
      this.watherIcon,
      this.weatherStatus,
      this.uv,
      this.sunrise,
      this.sunset,
      this.hourlyForecast});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      date: DateTime.parse(json['date']) as DateTime?,
      maxTemp: (json['day']['maxtemp_c'] as num?)?.toInt(),
      minTemp: (json['day']['mintemp_c'] as num?)?.toInt(),
      avgTemp: (json['day']['avgtemp_c'] as num?)?.toInt(),
      maxWind: json['day']['maxwind_kph'] as num?,
      avgHumidity: json['day']['avghumidity'] as num?,
      dailyChanceOfRain: json['day']['daily_chance_of_rain'] as num?,
      watherIcon: json['day']['condition']['icon'] as String?,
      weatherStatus: json['day']['condition']['text'] as String?,
      uv: json['day']['uv'] as num?,
      sunrise: json['astro']['sunrise'] as String?,
      sunset: json['astro']['sunset'] as String?,
      hourlyForecast: json['hour']
          .map<HourlyForecastModel>(
              (hour) => HourlyForecastModel.fromJson(hour))
          .toList() as List<HourlyForecastModel>?,
    );
  }
  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'maxtemp_c': maxTemp,
        'mintemp_c': minTemp,
        'avgtemp_c': avgTemp,
        'maxwind_kph': maxWind,
        'avghumidity': avgHumidity,
        'daily_chance_of_rain': dailyChanceOfRain,
        'day': {
          'condition': {'icon': watherIcon, 'text': weatherStatus}
        },
        'uv': uv,
        'astro': {'sunrise': sunrise, 'sunset': sunset},
        'hour': hourlyForecast?.map((hour) => hour.toJson()).toList(),
      };
}
