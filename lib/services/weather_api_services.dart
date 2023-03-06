import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_provider/constants/constants.dart';
import 'package:flutter_provider/models/direct_geocoding.dart';
import 'package:http/http.dart' as http;

class WeatherApiServices {
  final http.Client httpClient;

  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeoCoding(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: 'geo/1.0/direct',
      queryParameters: {
        'q': city,
        'limit': kLimit,
        'appid': dotenv.env['APPID'],
      },
    );

    try {
      final http.Response response = await httpClient.get(uri);
    } catch (e) {}
  }
}
