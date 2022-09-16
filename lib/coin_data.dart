import 'package:bitcoin_ticker/network_helper.dart';
import 'package:flutter/material.dart';

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
  'KRW',
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
  'XRP',
  'CRO',
  'LTC',
  'MED',
  'XTZ',
  'HUNT',
  'THETA',
];
const apiKey = '6FA44ED4-2461-4C1A-9E9A-FE4E553961F0';
const coinExchangeRateAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  CoinData({@required this.currency});
  final String currency;

  Future<List<CoinPrice>> getCoinData() async {
    List<CoinPrice> coinPriceList = [];
    for (var crypto in cryptoList) {
      var newItem = await CoinPrice(currency: currency, crypto: crypto);
      coinPriceList.add(newItem);
    }
    return coinPriceList;
  }
}

class CoinPrice {
  CoinPrice({@required this.currency, @required this.crypto}) {
    getCoinData();
  }
  final String currency;
  final String crypto;
  String price = '';

  void getCoinData() async {
    var url = '$coinExchangeRateAPIURL/$crypto/$currency?apikey=$apiKey';
    var priceData = await NetworkHelper(url: url).getData();
    print(priceData);
    price = priceData['rate'].toString();
  }
}
