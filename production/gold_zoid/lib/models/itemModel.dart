import 'package:gold_zoid/models/materialModel.dart';

enum ItemType {
  ring,
  earring,
  pendant,
  chain,
  bangle,
  bracelet,
  neklace,
  nosepin,
}

class Item {
  String itemId;
  ItemType type;
  MaterialType materialType;
  int qty;
  int weightInGramsPerUnit;
  double itemValue; 

  Item({ this.itemId , this.type , this.materialType , this.qty , this.weightInGramsPerUnit , this.itemValue });
}