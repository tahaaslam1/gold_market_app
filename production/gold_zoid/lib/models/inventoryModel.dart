import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/transactionModel.dart';
import 'itemModel.dart';

class Inventory{
  String totalGold;
  double totalGoldValue;
  List<Item> items; 

  Inventory({this.totalGold,this.totalGoldValue,this.items});

}
