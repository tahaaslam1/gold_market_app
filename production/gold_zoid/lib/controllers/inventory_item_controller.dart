import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/models/market_model.dart';
import 'package:gold_zoid/repositries/interfaces/item_interface.dart';
import 'package:gold_zoid/repositries/interfaces/marketInterface.dart';
import 'package:gold_zoid/repositries/inventory_item_repositry.dart';
import 'package:gold_zoid/repositries/marketRepositry.dart';

class ItemController extends ChangeNotifier {
  IItemRepositry reachRepositry = ItemRepositry();

  num _weight = 0.0;
  num _quantity = 0;
  num _karrot = 10;

  num get getWeight => _weight;
  num get getquantity => _quantity;
  num get getkarrot => _karrot;

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

  Future getItemList({String userId}) async {
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
    return;
  }

  Future<dynamic> addNewItem({String userEmailId, String itemType}) async {
    var msg = '';
    final IMarketRepositry _marketRepositry = MarketRepositry();

    List<Market> market = await _marketRepositry.getCurrentMarket();

    var valuePerOunce = market.first.materials
        .firstWhere((element) => element.materialType == 'gold')
        .valuePerOunce;

    num goldValue = (1 / valuePerOunce) / 31.1035;

    var itemValue = _quantity * _weight * ((_karrot / 24) * goldValue);

    var response = await reachRepositry.addNewItem(
        userEmailId: userEmailId,
        qty: _quantity,
        karrot: _karrot,
        weight: _weight,
        itemType: itemType,
        valuePerOunce: valuePerOunce,
        itemValue: itemValue);

    var decodedData = json.decode(response.body);

    if (decodedData['Response'] == 'Item Added') {
      msg = decodedData['Response'];
      if (decodedData['type'] == 'ring') {
        _ringList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'necklace') {
        _necklaceList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'earring') {
        _earringList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'bracelet') {
        _braceletList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'nosepin') {
        _nosepinList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'pendant') {
        _pendantList.add(Item.fromJson(decodedData));
      } else if (decodedData['type'] == 'chain') {
        _chainList.add(Item.fromJson(decodedData));
      }
      notifyListeners();
    } else {
      msg = decodedData['Response'];
    }
    return msg;
  }

  void addNewItemType() {}

  Future<dynamic> deleteItem(
      {String userId,
      String inventoryId,
      String itemId,
      String itemType}) async {
    var msg = '';
    var response = await reachRepositry.deleteItem(
        userId: userId, inventoryId: inventoryId, itemId: itemId);

    var decodedData = json.decode(response.body);
    if (decodedData['Response'] == 'Item Deleted') {
      if (itemType == 'ring') {
        _ringList.removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'necklace') {
        _necklaceList.removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'earring') {
        _earringList.removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'bracelet') {
        _braceletList.removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'nosepin') {
        _nosepinList..removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'pendant') {
        _pendantList.removeWhere((element) => element.itemId == itemId);
      } else if (itemType == 'chain') {
        _chainList.removeWhere((element) => element.itemId == itemId);
      }
      notifyListeners();
      msg = decodedData['Response'];
    } else {
      msg = 'Item Not Deleted';
    }

    return msg;
  }

  void updateItem() {}              // dhek lein ge  baaad 
}
