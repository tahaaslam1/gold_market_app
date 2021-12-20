import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/repositries/inventory_item_repositry.dart';

class ItemController extends ChangeNotifier {
  ItemRepositry reachRepositry = ItemRepositry();

  List<Item> _items = [];
  List<Item> _itemsType = [];
  // List<Item> _testList = [];
  // List<Item> _ringList = [];
  // List<Item> _pendant = [];
  // List<Item> _bracelet = []; 

  List<Item> get itemList {
    return [..._items];
  }

  List<Item> get itemTypeList {
    return [..._itemsType];
  }

  void getItemList({String userId}) async {
    var response = await reachRepositry.getItemList(userId: userId);
    var decodedData = json.decode(response.body);

    // decodedData.forEach(
    //   (e){
    //     var map = e.data();
    //     if(map['type'] == 'ring'){
    //       _ringList.add(Item.fromJson(map));
    //     }else if(map['type'] == 'pendant'){
    //       _pendant.add(Item.fromJson(map));
    //     }
    //     else if(map['type'] == 'bracelet'){
    //       _bracelet.add(Item.fromJson(map));
    //     }
    //   }
    // );
    

    for( var e in decodedData){
      _items.add(Item.fromJson(e));
      _itemsType.add(Item.fromJson(e));

    }
    notifyListeners();
  }

  void addNewItem() {}
  void addNewItemType() {}

  void deleteItem() {}

  void updateItem() {}
}
