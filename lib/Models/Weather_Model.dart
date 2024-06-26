class Weather_Model {
  final double? minTemp;
  final double? maxTemp;
  final double? avgTemp;
  final String? condition;
  final String? cityname;
  final DateTime? latstupdated;
  final String? image;

  Weather_Model({
    required this.image,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    required this.condition,
    required this.cityname,
    required this.latstupdated,
  });
  factory Weather_Model.fromJson(data) {
    return Weather_Model(
      minTemp: data['forecast']['forecastday'][0]['day']["mintemp_c"],
      maxTemp: data['forecast']['forecastday'][0]['day']["maxtemp_c"],
      avgTemp: data['forecast']['forecastday'][0]['day']["avgtemp_c"],
      condition: data['forecast']['forecastday'][0]['day']["condition"]["text"],
      cityname: data['location']['name'],
      latstupdated: DateTime.parse(data['current']['last_updated']),
      image: data['forecast']['forecastday'][0]["day"]["condition"]['icon'],
    );
  }
}
