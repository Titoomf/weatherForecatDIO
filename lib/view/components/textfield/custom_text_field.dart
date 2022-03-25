import 'package:flutter/material.dart';

import '../../../controller/weather_controller.dart';

class CustomTextField extends StatelessWidget {
  final WeatherController controller;

  const CustomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          controller.getIcons(),
          size: 75,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.model.value.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            controller.model.value.temperature,
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            controller.city,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }
}
