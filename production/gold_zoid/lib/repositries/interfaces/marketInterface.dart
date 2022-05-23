import 'package:gold_zoid/models/market_model.dart';

abstract class IMarketRepositry {
  Future<List<Market>> getCurrentMarket();
}
