import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gold_zoid/models/market_model.dart';
import 'package:gold_zoid/repositries/interfaces/marketInterface.dart';
import 'package:gold_zoid/repositries/marketRepositry.dart';

class MarketController extends ChangeNotifier {
 
  final IMarketRepositry _marketRepositry = MarketRepositry();

  Future<List<Market>> fetchMaterialPrice() {
    return _marketRepositry.getCurrentMarket();
  }

  // double getCurrentPrice(MaterialType materialType, List<Market> markets) {
  //   return getPriceFromMarket(materialType, markets.last);
  // }

  double getPriceFromMarket(String materialType, Market market, int purity) {   //TODO: change this String type of materialType to MaterialType after wards
    double valuePerOunce = market.materials.firstWhere((e) => e.materialType == materialType).valuePerOunce;
    double temp = (1 / valuePerOunce) / 31.1035; //We return the values based on the base currency. For example, for 1 USD the return is a number like 0.000634 for Gold (XAU).To get the gold rate per troy ounce in USD: 1/0.000634= 1577.28 USD
    if(materialType == 'gold'){
      return (purity / 24) * temp;
    }
    return (purity/999) * temp; //We return the values based on the base currency. For example, for 1 USD the return is a number like 0.000634 for Gold (XAU).To get the gold rate per troy ounce in USD: 1/0.000634= 1577.28 USD
  }
}
