import 'package:gold_zoid/models/inventory_model.dart';
import 'package:gold_zoid/models/transaction_model.dart';

class User {
  
  String userId;
  String password;
  String emailId; 
  String name;
  String phone;
  String profileUrl;
  Inventory inventory;
  List<Transaction> transactions;
 
  User({this.userId, this.name, this.phone, this.profileUrl, this.inventory,this.transactions,this.emailId,this.password});

  factory User.fromJson(Map<String, dynamic> json) {
        return User(
            emailId: json['email'], 
            password : json['password'],
            inventory: json['inventory'] != null ? Inventory.fromJson(json['inventory']) : null, 
            name: json['name'], 
            phone: json['phone'], 
            profileUrl: json['profileUrl'], 
            transactions: json['transactions'] != null ? (json['transactions'] as List).map((i) => Transaction.fromJson(i)).toList() : null, 
            userId: json['userid'], 
        );
    }

    Map<String, dynamic> toJson() => {
				'userid': userId,
				'name': name,
				'phone': phone,
				'email': emailId,
				'profileUrl': profileUrl,
				'inventory': inventory.toJson(),
				'transactions': transactions.map((e) => e.toJson()).toList(),
			};

}
