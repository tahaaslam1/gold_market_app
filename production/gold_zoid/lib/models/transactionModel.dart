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
  List<Item> items;
  
  Transaction({ this.id , this.type ,this.wastage, this.labour, this.items});
  
}