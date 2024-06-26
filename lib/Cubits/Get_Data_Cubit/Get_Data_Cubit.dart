import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Cubits/Get_Data_Cubit/Get_Data_State.dart';
import 'package:weather_app_new/Models/Weather_Model.dart';
import 'package:weather_app_new/Services/Get_Weather.dart';

class Get_Data_Cubit extends Cubit<WeatherState> {
  Get_Data_Cubit() : super(NO_Data_State());
  Weather_Model? weathermodel;
  Get_Weather({required String cityname}) async {
    try {
      weathermodel = await GetWeather().WeatherData(City: cityname);
      emit(Data_exciest_State());
    } catch (ex) {
      emit(Data_Failuer_State());
    }
  }
}
