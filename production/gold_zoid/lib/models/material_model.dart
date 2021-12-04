import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MaterialType {
  gold,
  silver,
}

class Material {
  
  MaterialType materialType;
  double valuePerOunce;

  Material({this.materialType, this.valuePerOunce});
  
  factory Material.fromJson(Map<String, dynamic> json) {
        return Material(
            materialType: json['materialType'],
            valuePerOunce: json['valuePerOunce'],
        );
    }
}
