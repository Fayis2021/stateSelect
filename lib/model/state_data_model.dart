class City {
  final String cityId;
  final String cityName;

  City({
    required this.cityId,
    required this.cityName,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['cityId'] ?? '',
      cityName: json['cityName'] ?? '',
    );
  }
}


class StateWithCities {
  final String stateId;
  final String stateName;
  final List<City> cities;

  StateWithCities({
    required this.stateId,
    required this.stateName,
    required this.cities,
  });

  factory StateWithCities.fromJson(Map<String, dynamic> json) {
    List<dynamic> cityList = json['city'] ?? [];
    List<City> cities = cityList.map((cityJson) => City.fromJson(cityJson)).toList();

    return StateWithCities(
      stateId: json['stateId'] ?? '',
      stateName: json['stateName'] ?? '',
      cities: cities,
    );
  }
}
