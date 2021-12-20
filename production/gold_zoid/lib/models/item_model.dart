import 'package:gold_zoid/models/material_model.dart';

// enum ItemType {
//   ring,
//   earring,
//   pendant, 
//   chain,
//   bangle,
//   bracelet,
//   neklace,
//   nosepin,
// }

class Item {
  String itemId;
  String type;
  Material material;
  int qty;
  double weightInGramsPerUnit;
  double itemValue;
  int karrot;

  Item({
    this.itemId,
    this.type,
    this.material,
    this.qty,
    this.weightInGramsPerUnit,
    this.itemValue,
    this.karrot
  });

factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            itemId: json['_id'],
            itemValue: json['itemValue'],
            material: json['material'] != null ? Material.fromJson(json['material']) : null,
            qty: json['qty'],
            type: json['type'],
            weightInGramsPerUnit: json['weightInGramsPerUnit'],
            karrot: json['karrot'],
        );
    }

    Map<String, dynamic> toJson() => {
				'itemId': itemId,
				'type': type,
				'material': material.toJson(),
				'qty': qty,
				'weightIngramsPerUnit': weightInGramsPerUnit,
				'itemValue': itemValue,
			};

}

