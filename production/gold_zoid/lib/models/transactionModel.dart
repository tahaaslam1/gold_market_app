import 'package:gold_zoid/models/itemModel.dart';

enum TransactionType{
  buy,
  sell,
}

class Transaction{
  
  String id;
  TransactionType type;
  double wastage;
  double labour;
  Item item;
  DateTime dateTime; 
  double transactionFinalAmount;
  
  Transaction({ this.id , this.type ,this.wastage, this.labour, this.item,this.dateTime,this.transactionFinalAmount});
  
}