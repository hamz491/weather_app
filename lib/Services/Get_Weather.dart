import 'package:dio/dio.dart';
import 'package:weather_app_new/Models/Weather_Model.dart';

class GetWeather {
  Future<Weather_Model> WeatherData({required String City}) async {
    try {
      final Dio dio = Dio();
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=bb216142d6694779a5a192249230610&q=$City&days=1');
      var data = response.data;
      Weather_Model weatherModel = Weather_Model.fromJson(data);

      return weatherModel;
    } on DioException catch (ex) {
      final String errormessage = ex.response?.data['error']['message'] ??
          'There is An Error Out Status Code';
      throw (errormessage);
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
