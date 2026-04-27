//2. Import the required packages.
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '9D7AA3D5-B010-45ED-98F7-E140EB043B6E';

class CoinData {
  String? selectedCurrency;
  late List<double> lastPriceMap=[];

  Future getCoinData(selectedCurrency) async {
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
    for(int i=0; i<cryptoList.length; i++){
      String selectedCrypto = cryptoList[i];
      String requestURL = '$coinAPIURL/$selectedCrypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestURL));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        lastPriceMap.add(lastPrice);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request with $cryptoList[i]';
      }
    }
    return lastPriceMap;

  }
}