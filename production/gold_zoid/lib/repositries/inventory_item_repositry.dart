import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/controllers/custom_exception_handler.dart';
import 'package:gold_zoid/repositries/interfaces/item_interface.dart';
import 'package:http/http.dart' as http;

class ItemRepositry implements IItemRepositry {
  getItemList({String userId}) async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.0.105:7000/api/user/getItemList/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      print('get item list response status : ${response.statusCode}');
      print('get item list response body: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  addNewItem(
      {String userEmailId,
      String itemType,
      var valuePerOunce,
      var qty,
      var weight,
      var itemValue,
      var karrot}) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.105:7000/api/user/additems'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, dynamic>{
            "emailId": userEmailId,
            "items": {
              "type": itemType,
              "material": {"valuePerOunce": valuePerOunce},
              "qty": qty,
              "weightInGramsPerUnit": weight,
              "itemValue": itemValue,
              "karrot": karrot,
            }
          },
        ),
      );
      print('add new item response status : ${response.statusCode}');
      print('add new item response body: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  Future<dynamic> deleteItem(
      {String userId, String inventoryId, String itemId}) async {
    try {
      var response = await http.delete(
        Uri.parse(
            'http://192.168.0.105:7000/api/user/deleteitem/$userId/$inventoryId/$itemId'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      print('delete item response status : ${response.statusCode}');
      print('delete item response body: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response; //= json.decode(response.body);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        throw BadRequestException(responseJson['Response'].toString());
      case 401:
      case 403:
        var responseJson = json.decode(response.body);
        throw UnauthorisedException(responseJson['Response'].toString());
      case 404:
        var responseJson = json.decode(response.body);
        throw PageNotFoundException(responseJson['Response'].toString());
      case 500:
      default:
        throw FetchDataException('No Internet Connection');
    }
  }
}
