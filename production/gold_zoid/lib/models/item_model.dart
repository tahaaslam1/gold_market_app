import 'package:gold_zoid/models/material_model.dart';

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
  Material material;
  int qty;
  int weightInGramsPerUnit;
  double itemValue;

  Item({
    this.itemId,
    this.type,
    this.material,
    this.qty,
    this.weightInGramsPerUnit,
    this.itemValue,
  });

factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            itemId: json['itemId'],
            itemValue: json['itemValue'],
            material: json['material'] != null ? Material.fromJson(json['material']) : null,
            qty: json['qty'],
            type: json['type'],
            weightInGramsPerUnit: json['weightIngramsPerUnit'],
        );
    }

}

