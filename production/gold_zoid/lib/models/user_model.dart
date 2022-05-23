import 'package:gold_zoid/models/inventory_model.dart';
import 'package:gold_zoid/models/transaction_model.dart';

class User {
  String userId;
  String password;
  String emailId;
  String name;
  String profileUrl;
  Inventory inventory;
  List<Transaction> transactions;

  User(
      {this.userId,
      this.name,
      this.profileUrl,
      this.inventory,
      this.transactions,
      this.emailId,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      emailId: json['emailId'],
      inventory: json['inventory'] != null
          ? Inventory.fromJson(json['inventory'])
          : null,
      name: json['name'],
      profileUrl: json['profileUrl'],
      //transactions: json['transactions'] != null ? (json['transactions'] as List).map((i) => Transaction.fromJson(i)).toList() : null,
      userId: json['_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userid': userId,
        'name': name,
        'email': emailId,
        'profileUrl': profileUrl,
        'inventory': inventory.toJson(),
        'transactions': transactions.map((e) => e.toJson()).toList(),
      };
}

