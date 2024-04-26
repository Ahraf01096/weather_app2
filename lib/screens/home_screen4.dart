import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_weather_app/bloc/weather_bloc_bloc.dart';

import '../widgets/backgroud.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('assets/1.png');
      case > 300 && <= 400:
        return Image.asset('assets/2.png');
      case > 500 && <= 600:
        return Image.asset('assets/3.png');
      case > 600 && <= 700:
        return Image.asset('assets/4.png');
      case > 700 && <= 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  const BackgroundColors(),
                  BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                    builder: (context, state) {
                      if (state is WeatherBlocSuccess) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📍 ${state.weather.areaName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              state.weather.date!.hour <
                                      state.weather.sunset!.hour
                                  ? const Text(
                                      'Good Morning',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25),
                                    )
                                  : const Text(
                                      'Good Evening',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25),
                                    ),
                              getWeatherIcon(
                                  state.weather.weatherConditionCode!),
                              // Image.asset('assets/1.png'),
                              Center(
                                child: Text(
                                  '${state.weather.temperature!.celsius!.toInt()}°C',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 55),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${state.weather.weatherMain!.toUpperCase()}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd -')
                                      .add_jm()
                                      .format(state.weather.date!),
                                  // '${state.weather.date!.day}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/11.png',
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Sunrise',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            DateFormat()
                                                .add_jm()
                                                .format(state.weather.sunrise!),
                                            // '5:33 am',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/12.png',
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Sunset',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            DateFormat()
                                                .add_jm()
                                                .format(state.weather.sunset!),
                                            // '5:33 am',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Divider(
                                  color: Colors.white54,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/13.png',
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Max Temp',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '${state.weather.tempMax!.celsius!.toInt()}°C',
                                            // '12 °C',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/14.png',
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Min Temp',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '${state.weather.tempMin!.celsius!.toInt()}°C',
                                            // '8 °C',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
