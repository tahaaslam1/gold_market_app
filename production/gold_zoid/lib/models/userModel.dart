import 'package:gold_zoid/models/inventoryModel.dart';

class User {
  
  String id;
  String name;
  String phone;
  String profileUrl;
  List<Inventory> inventory;

  User({this.id, this.name, this.phone, this.profileUrl, this.inventory});

}
