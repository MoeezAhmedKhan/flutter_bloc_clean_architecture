class AppException implements Exception{
  final _mesg;
  final _prefix;

  // []: Positional optional parameters
  AppException([this._mesg, this._prefix]);

  @override
  String toString() {
    return '$_mesg$_prefix';
  }
}

class NoInternetException extends AppException{
  NoInternetException([String? mesg]) : super(mesg, 'No Internet Found');
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? mesg]) : super(mesg, 'You dont have access');
}

class RequestTimeOutException extends AppException{
  RequestTimeOutException([String? mesg]) : super(mesg, 'Request time out');
}

class FetchDataException extends AppException{
  FetchDataException([String? mesg]) : super(mesg, 'Issue while fetching');
}