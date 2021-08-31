import 'package:gold_zoid/models/transactionModel.dart';

enum InventoryManagementType{
  manual, 
  byTransaction,
}

class Inventory{
  String totalGold;
  double totalGoldValue;
  List<Transaction> transactions;
  InventoryManagementType modeOfInventory;   // manually change krni he inentory ya buy sell se huga 
  
  
  Inventory({this.totalGold,this.totalGoldValue,this.transactions,this.modeOfInventory});

}
