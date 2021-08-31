import 'package:gold_zoid/models/marketModel.dart';
import 'package:gold_zoid/models/materialModel.dart';

abstract class IMarketRepositry {
  Future<List<Market>> getCurrentMarket();
}
