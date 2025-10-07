import 'dart:core';

class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No Internet Connection.');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "You don't have access to this.");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message]) : super(message, "Request Time out.");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}
