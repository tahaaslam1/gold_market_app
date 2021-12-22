import 'package:gold_zoid/repositries/interfaces/marketInterface.dart';
import 'dart:convert';
import 'package:gold_zoid/models/material_model.dart';
import 'package:gold_zoid/models/market_model.dart';
import 'package:http/http.dart' as http;

class MarketRepositry implements IMarketRepositry {
  
  Future<List<Market>> getCurrentMarket() async {
    List<Market> markets = [];
    var goldRate;
    var silverRate;

    http.Response response = await http.get(
        Uri.parse('https://www.metals-api.com/api/latest?access_key=krnr20cobh816f9ssjxuqn9nib23fq4j30v87fi29f43vu0qd53lc6fqe49n&base=USD&symbols=XAU%2CXAG%2CXPD%2CXPT%2CXRH'),
        );
// alternate api's: https://www.metals-api.com/api/latest?access_key=krnr20cobh816f9ssjxuqn9nib23fq4j30v87fi29f43vu0qd53lc6fqe49n&base=USD&symbols=XAU%2CXAG%2CXPD%2CXPT%2CXRH
//       : https://www.metals-api.com/api/latest?access_key=dma3cp7whe9z7ya4xh3bhcj0hu8ay4qnfsj1dhd9dc7toybi5l8597lkuldt
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      goldRate = decodedData['rates']['XAU'];
      silverRate = decodedData['rates']['XAG'];
    } else {
      print(response.statusCode);
      throw Exception('Failed to load Gold,Silver Rates'); 
    }
    final Market market = Market(
      time: DateTime.now(),
      materials: [
        Material(materialType :'gold',valuePerOunce: goldRate),
        Material(materialType :'silver',valuePerOunce:silverRate)
      ],
    );
    markets.add(market);

    return markets;
  }

  // double getPriceChange(MaterialType materialType){
  //   return getCurrentPrice(materialType) - getPriceFromMarket(materialType,markets[markets.length-2]);
  // }

}

