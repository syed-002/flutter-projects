import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD'; //starting value

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selectedCurrency = value;
            btcInSelectedCurrency = '?';
            ethInSelectedCurrency = '?';
            ltcInSelectedCurrency = '?';
            getData(selectedCurrency);
          }
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          btcInSelectedCurrency = '?';
          ethInSelectedCurrency = '?';
          ltcInSelectedCurrency = '?';
          getData(selectedCurrency);
        });
      },
      children: pickerItems,
    );
  }

  String btcInSelectedCurrency = '?';
  String ethInSelectedCurrency = '?';
  String ltcInSelectedCurrency = '?';
  bool isWaiting = false;

  void getData(String selCurr) async {
    setState(() {
      isWaiting = true;
    });
    try {
      List<double> data = await CoinData().getCoinData(selCurr);
      setState(() {
        btcInSelectedCurrency = data[0].toStringAsFixed(0);
        ethInSelectedCurrency = data[1].toStringAsFixed(0);
        ltcInSelectedCurrency = data[2].toStringAsFixed(0);
        isWaiting = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isWaiting = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                selectedCrypto: 'BTC',
                cryptoInSelectedCurrency: isWaiting ? '?' : btcInSelectedCurrency,
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                selectedCrypto: 'ETH',
                cryptoInSelectedCurrency: isWaiting ? '?' : ethInSelectedCurrency,
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                selectedCrypto: 'LTC',
                cryptoInSelectedCurrency: isWaiting ? '?' : ltcInSelectedCurrency,
                selectedCurrency: selectedCurrency,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : getDropDownButton(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    required this.cryptoInSelectedCurrency,
    required this.selectedCurrency,
    required this.selectedCrypto,
  });

  final String cryptoInSelectedCurrency;
  final String selectedCurrency;
  final String selectedCrypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $selectedCrypto = $cryptoInSelectedCurrency $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
