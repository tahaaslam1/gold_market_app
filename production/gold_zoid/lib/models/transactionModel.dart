import 'package:gold_zoid/models/marketModel.dart';
import 'package:gold_zoid/models/itemModel.dart';

enum TransactionType{
  buy,
  sell,
}

class Transaction{
  String id;
  TransactionType type;
  int wastage;
  int labour;
  Item item;
  Market market;
  
  Transaction({ this.id , this.type ,this.wastage, this.labour, this.item});
  
}