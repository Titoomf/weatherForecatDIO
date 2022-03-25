import 'package:climatempomvc/models/forecast_model.dart';
import 'package:climatempomvc/models/weather_model.dart';
import 'package:climatempomvc/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioForNative {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() async {
  test('deve retornar todas as informação', () async {
    final dio = DioMock();
    final response = RequestOptionsMock();

    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(requestOptions: response, data: jsonResponse),
    );
    final repository = WeatherRepository(dio);
    final clima = await repository.getClima('');
    expect(clima, isA<WeatherModel>());
    expect(clima.forecast[0], isA<ForecastModel>());
  });
}

final Map<String, dynamic> jsonResponse = {
  "temperature": "+27 °C",
  "wind": "9 km/h",
  "description": "Partly cloudy",
  "forecast": [
    {
      "day": "1",
      "temperature": "+28 °C",
      "wind": "12 km/h",
    },
    {
      "day": "2",
      "temperature": "26 °C",
      "wind": "11 km/h,",
    },
    {
      "day": "3",
      "temperature": " °C",
      "wind": "4 km/h",
    }
  ]
};
