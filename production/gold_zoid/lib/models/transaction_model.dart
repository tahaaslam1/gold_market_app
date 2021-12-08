import 'package:gold_zoid/models/item_model.dart';

// enum TransactionType{
//   buy,
//   sell,
// }

class Transaction{
   
  String transactionId;
  String type;
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

    Map<String, dynamic> toJson() => {
				'transactionid': transactionId,
				'type': type,
				'wastage': wastage,
				'labour': labour,
				'transactionFinalAmount': transactionFinalAmount,
				'item': item.toJson(),
			};
  
}