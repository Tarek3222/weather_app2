import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';

class CurrentWeatherModel {
  String? name;
  String? country;
  double? lat;
  double? lon;
  DateTime? lastUpdated;
  String? weatherState;
  String? weatherIcon;
  double? windSpeed;
  num? humidity;
  num? feelslikeC;
  num? tempC;
  num? uv;
  num? airQuality;
  List<ForecastWeatherModel>? forecastWeather;

  CurrentWeatherModel({
    this.name,
    this.country,
    this.lat,
    this.lon,
    this.lastUpdated,
    this.weatherState,
    this.weatherIcon,
    this.windSpeed,
    this.humidity,
    this.feelslikeC,
    this.tempC,
    this.uv,
    this.airQuality,
    this.forecastWeather,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      name: json['location']['name'] as String?,
      country: json['location']['country'] as String?,
      lat: json['location']['lat'] as double?,
      lon: json['location']['lon'] as double?,
      lastUpdated: DateTime.parse(json['current']['last_updated']) as DateTime?,
      weatherState: json['current']['condition']['text'] as String?,
      weatherIcon: json['current']['condition']['icon'] as String?,
      windSpeed: json['current']['wind_kph'] as double?,
      humidity: (json['current']['humidity'] as num?)?.toInt(),
      feelslikeC: json['current']['feelslike_c'] as num?,
      tempC: (json['current']['temp_c'] as num?)?.toInt(),
      uv: json['current']['uv'] as num?,
      airQuality: json['current']['air_quality']['pm2_5'] as num?,
      forecastWeather: json['forecast']['forecastday']
          .map<ForecastWeatherModel>(
              (day) => ForecastWeatherModel.fromJson(day))
          .toList() as List<ForecastWeatherModel>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'country': country,
        'lat': lat,
        'lon': lon,
        'lastUpdated': lastUpdated,
        'weatherState': weatherState,
        'weatherIcon': weatherIcon,
        'windSpeed': windSpeed,
        'humidity': humidity,
        'feelslikeC': feelslikeC,
        'tempC': tempC,
        'uv': uv,
        'airQuality': airQuality,
        'forecastWeather': forecastWeather,
      };
}
