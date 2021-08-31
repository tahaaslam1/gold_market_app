import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gold_zoid/models/materialModel.dart';
import 'package:gold_zoid/models/marketModel.dart';
import 'package:gold_zoid/repositries/marketInterface.dart';
import 'package:gold_zoid/repositries/marketRepositry.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class MarketController extends ChangeNotifier {
  final IMarketRepositry _marketRepositry = MarketRepositry();

  Future<List<Market>> fetchMaterialPrice() {
    return _marketRepositry.getCurrentMarket();
  }

  double getCurrentPrice(MaterialType materialType, List<Market> markets) {
    return getPriceFromMarket(materialType, markets.last);
  }

  double getPriceFromMarket(MaterialType materialType, Market market) {
    double valuePerOunce = market.materials.firstWhere((e) => e.materialType == materialType).valuePerOunce;
    notifyListeners(); 
    return (1 / valuePerOunce) / 31.1035; //We return the values based on the base currency. For example, for 1 USD the return is a number like 0.000634 for Gold (XAU).To get the gold rate per troy ounce in USD: 1/0.000634= 1577.28 USD
  }
}
