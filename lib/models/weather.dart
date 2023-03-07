import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String country;
  final String name;
  final DateTime lastUpdated;
  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.country,
    required this.name,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'],
      tempMin: main['temp_min'],
      tempMax: main['temp_max'],
      country: '',
      name: '',
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
        description: '',
        icon: '',
        temp: 100.0,
        tempMin: 100.0,
        tempMax: 100.0,
        country: '',
        name: '',
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      country,
      name,
      lastUpdated,
    ];
  }

  @override
  String toString() {
    return 'Weather(description: $description, icon: $icon, temp: $temp, tempMin: $tempMin, tempMax: $tempMax, country: $country, name: $name, lastUpdated: $lastUpdated)';
  }

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? country,
    String? name,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      country: country ?? this.country,
      name: name ?? this.name,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
