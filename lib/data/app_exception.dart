class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_message$_prefix';
  }
}

class InternetExcaption extends AppException {
  InternetExcaption([String? message]) : super(message, 'No internet');
}

class RequestTimeout extends AppException {
  RequestTimeout([String? message]) : super(message, 'Time out');
}

class ServerExcaption extends AppException {
  ServerExcaption([String? message]) : super(message, 'internel Server Error');
}

class InvalidUrl extends AppException {
  InvalidUrl([String? message]) : super(message, 'Invalid Api Url');
}

class FetchDataExcaption extends AppException {
  FetchDataExcaption([String? message]) : super(message, '');
}
