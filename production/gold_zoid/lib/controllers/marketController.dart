import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gold_zoid/models/materialModel.dart';
import 'package:gold_zoid/models/marketModel.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class MarketController extends ChangeNotifier{
  
  List<Market> markets = [];

   getCurrentMarket() async {
     double goldRate;
     double silverRate;
    //get data from api
    //store in market
    http.Response response = await http.get('https://www.metals-api.com/api/latest?access_key=krnr20cobh816f9ssjxuqn9nib23fq4j30v87fi29f43vu0qd53lc6fqe49n&base=USD&symbols=XAU%2CXAG%2CXPD%2CXPT%2CXRH');
    
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);

      goldRate = decodedData['rates']['XAU'];
      silverRate = decodedData['rates']['XAG'];
      
      notifyListeners();

    }
    else{
      print(response.statusCode);
    }
    final Market market = Market(
      time : DateTime.now(),
      materials : [Material(MaterialType.gold22,goldRate),Material(MaterialType.gold24,goldRate),Material(MaterialType.silver,silverRate)],
      
    );
     
    markets.add(market);
  }
  
  double getCurrentPrice(MaterialType materialType){
    return getPriceFromMarket(materialType,markets.last);
  }
  
  double getPriceFromMarket(MaterialType materialType,Market market){
    return market.materials.firstWhere((e)=>e.materialType==materialType).valuePerOunce;
  }
  
  double getPriceChange(MaterialType materialType){
    return getCurrentPrice(materialType) - getPriceFromMarket(materialType,markets[markets.length-2]);
  }
  
}