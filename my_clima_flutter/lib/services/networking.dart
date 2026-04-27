import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      //var longitude = jsonDecode(data)['coord']['lon'];
      //  print(longitude);
      //  //there can be lists sometimes so list is at 0th index
      //  //when you see it from the json viewer pro, directly copy path without much headache
      //  var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      //  print(weatherDescription);
      // // print(response.body);
      //  // the output of an api response would a json formatted
      // jsondecode is dynamic datatype, dunno until it is assigned
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
