import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/transaction_model.dart';
import 'item_model.dart';

class Inventory{ 
  String totalGold;
  double totalGoldValue;
  List<Item> items; 

  Inventory({this.totalGold,this.totalGoldValue,this.items});

  factory Inventory.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Item> itemsList = list.map((i) => Item.fromJson(i)).toList();
        return Inventory(
            items: itemsList,
            totalGold: json['totalGold'],
            totalGoldValue: json['totalGoldValue'],
        );
    }

    Map<String, dynamic> toJson() => {
				'totalGold': totalGold,
				'totalGoldValue': totalGoldValue,
				'items': items.map((e) => e.toJson()).toList(),
			};

}
