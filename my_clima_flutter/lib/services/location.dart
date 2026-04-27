import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude, longitude;

  //Location({ this.latitude, this.longitude});

  Future<void> getCurrentLocation() async{
    try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;

      //for running the method that throws the exception
      //somethingThatExpectsLessThan10(12);
    }
    catch (e) {
      print(e);
    }
  }


}

