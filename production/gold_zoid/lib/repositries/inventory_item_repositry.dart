import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/controllers/custom_exception_handler.dart';
import 'package:http/http.dart' as http;


class ItemRepositry{

  getItemList({String userId}) async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.0.109:7000/api/user/getItemList/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      print('get item list response status : ${response.statusCode}');
      print('get item list response body: ${response.body}');
       var responseJson = _response(response);
       return responseJson;
      } on SocketException{
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