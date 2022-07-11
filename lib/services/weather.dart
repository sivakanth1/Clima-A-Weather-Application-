import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "5376d3acb8fb6330e1e3f2d1a2f55660";
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper helper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await helper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = Location();
    await l.getCurrentPosition();
    NetworkHelper helper = NetworkHelper(
        '$openWeatherMapUrl?lat=${l.lati}&lon=${l.longi}&appid=$apiKey&units=metric');
    var weatherData = await helper.getData();
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

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return 'images/lessthan300.png';
    } else if (condition < 400) {
      return 'images/rainy.png';
    } else if (condition < 600) {
      return 'images/showerrain.png';
    } else if (condition < 700) {
      return 'images/snowy.png';
    } else if (condition < 800) {
      return 'images/haze.png';
    } else if (condition == 800) {
      return 'images/sunny.png';
    } else if (condition <= 804) {
      return 'images/cloudy.png';
    } else {
      return 'images/location_background.png';
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
