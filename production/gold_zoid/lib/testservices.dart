import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'models/inventory_model.dart';
import 'models/application_model.dart';

Future<String> _loadProductAsset() async {
  return await rootBundle.loadString('assets/dummyData.json');
}
/*
Product _parseJsonForCrossword(String jsonString) {
  Map JSON = json.decode(jsonString);
  List<Image> words = new List<Image>();
  for (var word in JSON['across']) {
    words.add(new Image(word['number'], word['word']));
  }
  return new Product(JSON['id'], JSON['name'], new Image(words));
}
*/


Future loadInventory(userID) async {
  String jsonProduct = await _loadProductAsset();
  final jsonResponse = json.decode(jsonProduct);
  Application application = new Application.fromJson(jsonResponse);
  // for (int i = 0; i <= 1; ++i) {
  //   print(application.users[0].inventory.items[i].itemId);
  // }
  application.users.forEach((element) {
    print(element.inventory.items.map((e) => e.itemId).toList());
  });
}