import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/transaction_model.dart';
import 'item_model.dart';

class Inventory{ 
  String totalGold;
  double totalGoldValue;
  List<Item> items; 

  Inventory({this.totalGold,this.totalGoldValue,this.items});

  factory Inventory.fromJson(Map<String, dynamic> json) {
        return Inventory(
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null,
            totalGold: json['totalGold'],
            totalGoldValue: json['totalGoldValue'],
        );
    }

}
