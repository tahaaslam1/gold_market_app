import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/transaction_model.dart';
import 'item_model.dart';

class Inventory{ 
  num totalGold;
  num totalGoldValue;
  List<dynamic> items; 
  String inventoryId;

  Inventory({this.totalGold,this.totalGoldValue,this.items,this.inventoryId});

  factory Inventory.fromJson(Map<String, dynamic> json) {
   // var list = json['items'] as List;
    //List<Item> itemsList = list.map((i) => Item.fromJson(i)).toList();
        return Inventory(
            totalGold: json['totalGold'],
            totalGoldValue: json['totalGoldValue'],
            inventoryId : json['_id'],
            	items: (json['items'] as List<dynamic> )
						?.map((e) => e == null
								? null
								: Item.fromJson(e))
						?.toList(),
        );
    }

    Map<String, dynamic> toJson() => {
				'totalGold': totalGold,
				'totalGoldValue': totalGoldValue,
				'items': items.map((e) => e.toJson()).toList(),
			};

}

// factory Inventory.fromMap(Map<String, dynamic> data) => Inventory(
// 				totalGold: data['totalGold'] as String,
// 				totalGoldValue: (data['totalGoldValue'] as num).toDouble(),
// 				items: (data['items'] as List<dynamic>)
// 						?.map((e) => e == null
// 								? null
// 								: Item.fromMap(e as Map<String, dynamic>))
// 						?.toList(),
// 			);