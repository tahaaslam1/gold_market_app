import 'package:gold_zoid/models/marketModel.dart';

abstract class IMarketRepositry {
  Future<List<Market>> getCurrentMarket();
  
}
