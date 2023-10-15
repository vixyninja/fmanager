class ErrorExceptions implements Exception {
  final String _message;
  final String _prefix;

  ErrorExceptions([this._message = '', this._prefix = 'Request Error: ']);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends ErrorExceptions {
  FetchDataException([String message = '']) : super(message, 'Error During Communication: ');
}

class BadRequestException extends ErrorExceptions {
  BadRequestException([String message = '']) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends ErrorExceptions {
  UnauthorisedException([String message = '']) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends ErrorExceptions {
  InvalidInputException([String message = '']) : super(message, 'Invalid Input: ');
}
