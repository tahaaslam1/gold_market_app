import 'package:gold_zoid/models/itemModel.dart';

enum TransactionType{
  buy,
  sell,
}

class Transaction{
  
  String transactionId;
  TransactionType type;
  double wastage;
  double labour;
  Item item;
  DateTime dateTime; 
  double transactionFinalAmount;
  
  Transaction({ this.transactionId , this.type ,this.wastage, this.labour, this.item,this.dateTime,this.transactionFinalAmount});
  
}