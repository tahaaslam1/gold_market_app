
import 'package:flutter/cupertino.dart';

enum MaterialType{
  gold,
  silver
}

class Material{
 
  MaterialType materialType;
  
  double valuePerOunce;
  
  Material( this.materialType , this.valuePerOunce ); 

}