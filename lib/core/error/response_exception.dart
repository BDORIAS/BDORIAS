
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/app_string.dart';
import 'exceptions.dart';

dynamic returnResponse(http.Response response) {
  print('status: ');
  print(response.statusCode);
  // // print(response.body);
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body);
    case 201:
      return json.decode(response.body);
    case 400:
      throw BadRequestException();
    case 401:
      throw UnauthorizedException(json.decode(response.body)['msg']);
    case 404:
      throw NotFoundException(AppStrings.notFoundException);
    case 409:
      throw DataRegistradoException(json.decode(response.body)['msg']);
    case 500:
      throw InternalServerErrorException(json.decode(response.body)['msg']);

    default:
      throw InternalServerErrorException();
  }
}