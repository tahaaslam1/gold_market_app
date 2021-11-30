import 'package:gold_zoid/models/inventoryModel.dart';
import 'package:gold_zoid/models/transactionModel.dart';

class User {
  
  String userId;
  String emailId; 
  String name;
  String phone;
  String profileUrl;
  Inventory inventory;
  List<Transaction> transactions;

  User({this.userId, this.name, this.phone, this.profileUrl, this.inventory,this.transactions,this.emailId});

}
