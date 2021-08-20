
import 'package:flutter/cupertino.dart';

enum MaterialType{
  gold24,
  gold22,
  silver
}

class Material{
 
  MaterialType materialType;
  
  double valuePerOunce;
  
  Material( this.materialType , this.valuePerOunce ); 

}