import '../services/networking.dart';
import '../services/location.dart';

const apiKey = 'e1e3933712313ee22fda05e1b18723d8';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
//methods should be marked async for be able to use await.
  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    //removing all these for refactoring and shortening the code.
    // latitude = myLocation.latitude;
    // new_latitude = latitude.toString();
    // longitude = myLocation.longitude;
    // new_longitude = longitude.toString();
    //in the api request it takes as a string than a double, it was 401 error if not converted into string

    // now i want the temperature in celsius which is metric system. so i will add it at the end of this url since it is very common that the api provider created another api for it.
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    // var temperature = weatherData.['main']['temp'];
    // var condition = networkHelper.decodedData['weather'][0]['id'];
    // var city = networkHelper.decodedData['name'];
    // print('$temperature $condition $city');

    //now i want to return wtv weather data im gettinh from this method.
    return weatherData;// the return type of this method would be same as the data type of the weatherData
  }

  Future getCityWeather(String cityName) async{
    var getCityURL = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: getCityURL);

    var weatherData = await networkHelper.getData(); //getdata is async
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
