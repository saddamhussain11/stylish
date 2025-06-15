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

class ServerTimeout extends AppException {
  ServerTimeout([String? message]) : super(message, 'Time out');
}
