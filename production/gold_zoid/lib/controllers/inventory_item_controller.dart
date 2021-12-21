import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/repositries/inventory_item_repositry.dart';

class ItemController extends ChangeNotifier {
  ItemRepositry reachRepositry = ItemRepositry();

  double _weight = 0.0;
  int _quantity = 0;
  int _karrot = 10;

  double get getWeight => _weight;
  int get getquantity => _quantity;
  int get getkarrot => _karrot;

  void incrementWeight() {
    _weight = _weight + 0.5;
    notifyListeners();
  }

  void decrementWeight() {
    if (_weight > 0) _weight = _weight - 0.5;
    notifyListeners();
  }

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 0) --_quantity;
    notifyListeners();
  }

  void incrementKarrot() {
    if (_karrot >= 10 && _karrot < 24) ++_karrot;
    notifyListeners();
  }

  void decrementKarrot() {
    if (_karrot > 10 && _karrot <= 24) --_karrot;
    notifyListeners();
  }

  List<Item> _ringList = [];
  List<Item> _earringList = [];
  List<Item> _pendantList = [];
  List<Item> _chainList = [];
  List<Item> _bangleList = [];
  List<Item> _braceletList = [];
  List<Item> _necklaceList = [];
  List<Item> _nosepinList = [];

  List<Item> get getRingList {
    return [..._ringList];
  }

  List<Item> get getEarringList {
    return [..._earringList];
  }

  List<Item> get getPendantList {
    return [..._pendantList];
  }

  List<Item> get getChainList {
    return [..._chainList];
  }

  List<Item> get getBangleList {
    return [..._bangleList];
  }

  List<Item> get getBraceletList {
    return [..._braceletList];
  }

  List<Item> get getNecklaceList {
    return [..._necklaceList];
  }

  List<Item> get getNosepinList {
    return [..._nosepinList];
  }

  void getItemList({String userId}) async {
    _ringList = [];
    _earringList = [];
    _pendantList = [];
    _chainList = [];
    _bangleList = [];
    _braceletList = [];
    _necklaceList = [];
    _nosepinList = [];

    var response = await reachRepositry.getItemList(userId: userId);

    var decodedData = json.decode(response.body);

    for (var e in decodedData) {
      var map = e;
      if (map['type'] == 'ring') {
        _ringList.add(Item.fromJson(e));
      } else if (map['type'] == 'necklace') {
        _necklaceList.add(Item.fromJson(e));
      } else if (map['type'] == 'earring') {
        _necklaceList.add(Item.fromJson(e));
      } else if (map['type'] == 'bracelet') {
        _braceletList.add(Item.fromJson(e));
      } else if (map['type'] == 'nosepin') {
        _nosepinList.add(Item.fromJson(e));
      } else if (map['type'] == 'pendant') {
        _pendantList.add(Item.fromJson(e));
      } else if (map['type'] == 'chain') {
        _chainList.add(Item.fromJson(e));
      }
    }
  }

  void addNewItem({String userEmailId}) {
    var response = reachRepositry.addNewItem(userEmailId: userEmailId);
    
  }
  void addNewItemType() {}

  void deleteItem() {}

  void updateItem() {}
}
