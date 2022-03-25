import 'package:dio/dio.dart';

import 'package:climatempomvc/models/weather_model.dart';

class WeatherRepository {
  final Dio dio;
  WeatherRepository(
    this.dio,
  );

  Future<WeatherModel> getClima(String city) async {
    final url = 'https://goweather.herokuapp.com/weather/$city';
    final response = await dio.get(url);
    final body = response.data;
    if (response.statusCode == 200) {
      final WeatherModel json = WeatherModel.fromMap(body);
      return json;
    } else {
      throw Exception('Error na API WEATHER FORECAST');
    }
  }
}
