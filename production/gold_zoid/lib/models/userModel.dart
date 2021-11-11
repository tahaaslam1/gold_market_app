import 'package:gold_zoid/models/inventoryModel.dart';
import 'package:gold_zoid/models/transactionModel.dart';

class User {
  
  String id;
  String name;
  String phone;
  String profileUrl;
  Inventory inventory;
  List<Transaction> transactions;

  User({this.id, this.name, this.phone, this.profileUrl, this.inventory,this.transactions});

}
