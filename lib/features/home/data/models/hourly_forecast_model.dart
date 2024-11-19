class HourlyForecastModel {
  DateTime? time;
  int? temp;
  String? icon;
  String? status;
  num? chanceOfRain;

  HourlyForecastModel(
      {this.time, this.temp, this.icon, this.status, this.chanceOfRain});

  HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']) as DateTime?;
    temp = (json['temp_c'] as num?)?.toInt();
    icon = json['condition']['icon'] as String?;
    status = json['condition']['text'] as String?;
    chanceOfRain = json['chance_of_rain'] as num?;
  }

  Map<String, dynamic> toJson() => {
        'time': time?.toIso8601String(),
        'temp_c': temp,
        'condition': {'icon': icon, 'text': status},
        'chance_of_rain': chanceOfRain,
      };
}
