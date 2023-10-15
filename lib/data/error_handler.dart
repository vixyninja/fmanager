import 'package:fmanager/data/error_exceptions.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ErrorHandler {
  static returnErrorToString(Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error in Server with StatusCode : ${response.statusCode}');
    }
  }
}
