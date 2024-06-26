import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_Cubit.dart';
import 'package:weather_app_new/Models/Weather_Model.dart';
import 'package:weather_app_new/Widgets/GetTheme.dart';

class Data_Page extends StatelessWidget {
  const Data_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Weather_Model data = BlocProvider.of<Get_Data_Cubit>(context).weathermodel!;
    MaterialColor maincolor = getTheme(data.condition);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            maincolor,
            maincolor.shade300,
            maincolor.shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Spacer(flex: 2),
          Column(
            children: [
              Text(
                '${data.cityname}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'Updated: ${data.latstupdated!.hour}:${data.latstupdated!.minute}',
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              data.image!.contains('https')
                  ? Image.network('${data.image}')
                  : Image.network('https:${data.image}'),
              Text(
                '${data.avgTemp!.round()}',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  Text('max: ${data.maxTemp!.round()}'),
                  Text('mini: ${data.minTemp!.round()}'),
                ],
              )
            ],
          ),
          const Spacer(flex: 1),
          Text(
            '${data.condition}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
