import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_Cubit.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_State.dart';
import 'package:weather_app_new/View/HomeView.dart';
import 'package:weather_app_new/View/Search_Page.dart';
import 'package:weather_app_new/Widgets/GetTheme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get_Data_Cubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<Get_Data_Cubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primaryColor: getTheme(
                      BlocProvider.of<Get_Data_Cubit>(context)
                          .weathermodel
                          ?.condition)),
              routes: {
                'searchpage': (context) => Search_Page(),
              },
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}
