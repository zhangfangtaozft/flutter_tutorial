import 'package:geolocator/geolocator.dart';
import 'networking.dart';

const apiKey = 'b227c1bd1277b925809dddd5ebed1d99';

class WeatherModel {

  Future<Position> _getLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return _position;
  }

  Future getCityWeather(String cityName) async {
    var url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q' : cityName, 'appid' : apiKey, 'units' : 'metric'}
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather(Position position) async {
    var latitude = position.latitude;
    var longitude = position.longitude;
    var url = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: {'lat' : '$latitude', 'lon' : '$longitude', 'appid' : apiKey, 'units' : 'metric'}
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getCurrentLocationWeather() async {
    Position position = await _getLocationData();
    var weatherData = await getLocationWeather(position);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}