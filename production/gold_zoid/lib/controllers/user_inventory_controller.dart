import 'package:flutter/material.dart';
import 'package:gold_zoid/models/inventory_model.dart';
import 'dart:convert';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/repositries/interfaces/user_inventory_interface.dart';
import 'package:gold_zoid/repositries/user_inventory_repositry.dart';

Inventory userInventory;

class UserInventoryController extends ChangeNotifier {
  final IUserInventoryRepository reachRepositry = UserInventoryRepository();

  Inventory get getLoggedInUserInventory => userInventory;

  getUserInventory({String userId}) async {
    var response = await reachRepositry.getUserInventory(userId: userId);
    var decodedData = json.decode(response.body);

    userInventory = Inventory.fromJson(decodedData);
  }
}
