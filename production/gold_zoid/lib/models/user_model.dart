import 'package:gold_zoid/models/inventory_model.dart';
import 'package:gold_zoid/models/transaction_model.dart';

class User {
  
  String userId;
  String emailId; 
  String name;
  String phone;
  String profileUrl;
  Inventory inventory;
  List<Transaction> transactions;
 
  User({this.userId, this.name, this.phone, this.profileUrl, this.inventory,this.transactions,this.emailId});

  factory User.fromJson(Map<String, dynamic> json) {
        return User(
            emailId: json['email'], 
            inventory: json['inventory'] != null ? Inventory.fromJson(json['inventory']) : null, 
            name: json['name'], 
            phone: json['phone'], 
            profileUrl: json['profileUrl'], 
            transactions: json['transactions'] != null ? (json['transactions'] as List).map((i) => Transaction.fromJson(i)).toList() : null, 
            userId: json['userid'], 
        );
    }

}
