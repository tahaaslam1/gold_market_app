import 'package:gold_zoid/models/item_model.dart';

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

   factory Transaction.fromJson(Map<String, dynamic> json) {
        return Transaction(
            item: json['item'] != null ? Item.fromJson(json['item']) : null, 
            labour: json['labour'], 
            transactionFinalAmount: json['transactionFinalAmount'], 
            transactionId: json['transactionid'], 
            type: json['type'], 
            wastage: json['wastage'], 
        );
    }
  
}