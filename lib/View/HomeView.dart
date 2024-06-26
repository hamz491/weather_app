import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_Cubit.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_State.dart';
import 'package:weather_app_new/Widgets/Data_Page.dart';
import 'package:weather_app_new/Widgets/ErrorPage.dart';
import 'package:weather_app_new/Widgets/No_Data_Page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('searchpage');
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body:
          BlocBuilder<Get_Data_Cubit, WeatherState>(builder: (context, state) {
        if (state is NO_Data_State) {
          return const NO_Data_Page();
        } else if (state is Data_exciest_State) {
          return const Data_Page();
        } else {
          return const ErrorPage();
        }
      }),
    );
  }
}
