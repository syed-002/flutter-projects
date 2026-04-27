import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //adding init state such that we will get location as soon as the app opens
  //init only gets called once. build might get caleled whenever there's change
  //so you should not put any code which might get called repeatedly coz that might get expensive.

  //not using since refactored, directly in the url.
  // late double latitude, longitude;
  // late String new_latitude, new_longitude;

  @override
  void initState() {
    // TODO: implement initState
    getLocationData();
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  //life cycle methods can tap into particular moment in the life fof hte
  //stateful widgets, if you want to save a piece of data or if you wanna
  //deallocate smthn from memrory or if youwant to create a new object as
  //soon as the stateful method gets initialized, these are the methods

//this pieceo of code didnt work
  //but with exception handling, try and catch this same piece of code worked!!!!!!!!
  void getLocationData() async {

    // WeatherModel weatherModel = WeatherModel();
    // var weatherData = weatherModel.getLocationWeather();
    //yyou can even shorten it as since you gonna be using it only once
    var weatherData = await WeatherModel().getLocationWeather();
    //you need to remember that this method should be marked await since getLocaiton method returns a future

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    //practice example.
    // String myMargin = '15';
    // //getData();
    // //this wouldnt crash the app as well as show the error in terminall along with our screen of red background, exception handling
    // // try {
    // //   double myMarginAsDouble = double.parse(myMargin);
    // //   return Scaffold(
    // //     body: Container(
    // //       color: Colors.red,
    // //       margin: EdgeInsets.all(myMarginAsDouble),
    // //     ),
    // //   );
    // // }
    // // catch(e) {
    // //   print(e);
    // //   return Scaffold(
    // //     body: Container(
    // //       color: Colors.red,
    // //       margin: EdgeInsets.all(30),
    // //     ),
    // //   );
    // // }
    //
    // //this above piece of code can be written same as
    // double myMarginAsDouble;
    // try {
    //   myMarginAsDouble = double.parse(myMargin);
    // }
    // catch (e) {
    //   print(e);
    //   myMarginAsDouble = 30;
    // }
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      // body: Container(
      //   color: Colors.red,
      //   margin: EdgeInsets.all(myMarginAsDouble),
      //   // margin: EdgeInsets.all(myMarginAsDouble ?? 30.0), //if its null then use 30.
      // ),
    );
  }
}