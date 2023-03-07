class WeatherException implements Exception {
  String message;
  WeatherException([this.message = 'something went wrong']) {
    message = 'Weather Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
