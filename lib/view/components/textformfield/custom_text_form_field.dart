import 'package:flutter/material.dart';

import '../../../controller/weather_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final WeatherController controller;

  const CustomTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: controller.onChange,
      decoration: InputDecoration(
        labelText: 'Cidade',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
