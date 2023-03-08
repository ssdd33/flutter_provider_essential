import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/constants/constants.dart';
import 'package:flutter_provider/providers/weather/weather_provider.dart';
part 'theme_state.dart';

class ThemeProvider with ChangeNotifier {
  ThemeState _state = ThemeState.initial();
  ThemeState get state => _state;

  void update(WeatherProvider wp) {
    if (wp.state.weather.temp > kWarmOrNot) {
      _state = _state.copyWith(appTheme: AppTheme.light);
    } else {
      _state = _state.copyWith(appTheme: AppTheme.dark);
    }
    notifyListeners();
  }
}
