import 'package:dio/dio.dart';
import 'package:fmanager/data/error_exceptions.dart';

class ErrorHandler {
  static returnErrorToString(Response response) {
    switch (response.statusCode) {
      case 400:
        return throw BadRequestException('Bad Request');
      case 401:
        return throw UnauthorisedException('Unauthorised');
      case 403:
        return throw FetchDataException('Forbidden');
      case 500:
      default:
        return throw FetchDataException('Error in Server with StatusCode : ${response.statusCode}');
    }
  }
}
