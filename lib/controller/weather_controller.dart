import 'package:climatempomvc/models/weather_model.dart';
import 'package:flutter/material.dart';

import '../repository/weather_repository.dart';
import '../shared/weather_icons_icons.dart';

class WeatherController extends ChangeNotifier {
  // aqui eu pego o meu metodo la no repositorio
  final WeatherRepository repository;

  String city = 'Laguna';

  WeatherController({
    required this.repository,
  });

  ValueNotifier<WeatherModel> model = ValueNotifier(
    WeatherModel(
      forecast: [],
      temperature: '',
      wind: '',
      description: '',
    ),
  );

  Future<void> getClimaRepository() async {
    final modelClima = await repository.getClima(city);

    model.value = modelClima;
  }

  void onChange(value) {
    city = value;
    notifyListeners();
  }

  String getImagens() {
    if (model.value.description == 'Sunny') {
      return 'assets/images/sunny.png';
    } else if (model.value.description == 'Partly cloudy') {
      return 'assets/images/nublado.png';
    } else if (model.value.description == 'Patchy rain possible') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/chuva_leve.png';
    }
  }

  IconData getIcons() {
    if (model.value.description == 'Sunny') {
      return WeatherIcons.sun;
    } else if (model.value.description == 'Partly cloudy') {
      return WeatherIcons.cloudSun;
    } else if (model.value.description == 'Patchy rain possible') {
      return WeatherIcons.drizzle;
    } else {
      return WeatherIcons.cloud;
    }
  }
}
