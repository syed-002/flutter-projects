import 'package:flutter/material.dart';
import 'package:my_clima_flutter/screens/city_screen.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';
// import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  // passing location data from loading screen to the location screen

  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

//passing data to state object. we need to display weather info from the loading screen inside the text widget of the location screen. ie getting the data from location screen object to location screen state object.(from stateful widget to state object ie from top to bottom.) and this is fundamental in flutter. remember tht location screen statful widget is actually a separate object from its state and the text widgets dont live inside the location screen. instead the text widgets live in the build method of the state object. however the location screen object and location screen state object are linked. in other words, the state object knownws which stateful object it belongs to. the state object has a property called widget wchich will point to its parent stateful widget.

//now im gonna print the data from top this bottom state object.
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  // late int condition; //modifying condtion to string for that symbol we wanna display and that condition which would be int would be directly passed in the updateUI func and is turned into a var which will be used inside only that fucn.
  late String
      weatherIcon; // for storing the emojis, which are processed as strings
  late String condition;
  late String city;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    // print(widget.locationWeather);
    //widget belongs to the stateful object. so you can get that data here of location weather
    // you get the widget object inside every single state object. it is the current configuration. so a state object configuration is the corresponding stateful widget instance.
    // so we were passing that location data from the loading screen to the location scrren. and from our location screen state, we can tap into the location screen through widget and tap into that property locationWeather. so two passes in order to get here.
  }

  void updateUI(dynamic weatherData) {
    // for making a double tempt to int temp
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        weatherMessage = "Unable to get weather data";
        city = "";
        return; //this will prematurely end the method to not run the  next lines, this will get out of the method.
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //now the condition will only exist in this updateUI fucntion.
      var condition = weatherData['weather'][0]['id'];
      city = weatherData['name'];

      //units in celsius ie metric and imperial if farhenheit
      print("temp: $temperature");

      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      //should get trickered to get the request of the current weather,  locaiton. since it is modularized, we can use it multiple screens.
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);

                      //you gonna get the locaitn onlyif you use await since it si future.
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      // print (typedName);
                      if(typedName != null){
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      //emojis are processed just like strings
                      // '☀️',
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  // "It's 🍦 time in San Francisco!",
                  "$weatherMessage in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
