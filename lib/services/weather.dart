import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';


const apiKey = '7725f062e48ef76a27f04fb0bd096a41';
class WeatherModel {


  void getLocationWeather(){
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longtitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=33&lon=139&appid=$apiKey&units=metrics');
    var weatherData = await networkHelper.getData();

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

















