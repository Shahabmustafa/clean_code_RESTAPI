

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return "$_prefix$_message";
  }
}

class NoInternetException extends AppException {
  NoInternetException([String message = '']) : super(message, '');
}

class FetchDataException extends AppException {
  FetchDataException([String message = '']) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([String message = '']) : super(message, '');
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([String message = ''])
      : super(message, 'Unauthorised: ');
}

class ForbiddenException extends AppException {
  ForbiddenException([String message = '']) : super(message, 'Forbidden: ');
}

class ResourceNotFoundException extends AppException {
  ResourceNotFoundException([String message = ''])
      : super(message, '');
}

class InternalServerException extends AppException {
  InternalServerException([String message = ''])
      : super(message, 'Server Error: ');
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String message = ''])
      : super(message, 'Service Unavailable: ');
}