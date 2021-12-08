import 'package:gold_zoid/models/item_model.dart';

class UserInventoryRepository{
  // get user inventory

  List<Item> _userItems = [];

  void getUserInventory(userID) {
    print('getting user inventory..');

    _userItems = [];
  
  }
}
