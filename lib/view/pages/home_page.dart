import 'package:climatempomvc/models/weather_model.dart';
import 'package:climatempomvc/view/components/textfield/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../controller/weather_controller.dart';
import '../../repository/weather_repository.dart';
import '../components/cards/custom_weather_cards.dart';
import '../components/textformfield/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    controller.getClimaRepository();
  }

  final WeatherController controller =
      WeatherController(repository: WeatherRepository(Dio()));

  @override
  Widget build(BuildContext context) {
    // pega o tamanho da tela do celular
    var size = MediaQuery.of(context).size;
    return ValueListenableBuilder<WeatherModel>(
        valueListenable: controller.model,
        builder: (context, value, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    controller.getImagens(),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              // //tamanho do meu TextFormField
                              height: size.height * 0.090,
                              width: size.width * 0.6,
                              child: CustomTextFormField(
                                controller: controller,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                controller.getClimaRepository();
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ],
                        ),
                        CustomTextField(
                          controller: controller,
                        ),
                        Container(
                          // tamanho do container debaixo
                          height: size.height * 0.23,
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.black45,
                          ),
                          alignment: Alignment.center,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.model.value.forecast.length,
                            itemBuilder: (context, index) {
                              final forecast =
                                  controller.model.value.forecast[index];
                              return CustomWeatherCard(
                                height: size.height * 0.15,
                                width: size.width * 0.30,
                                day: forecast.day,
                                temperature: forecast.temperature,
                                wind: forecast.wind,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
