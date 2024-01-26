/// This calss contains the setupe for the api
/// can be used to setup the uri for each endpoint
class ApiData {
  /// This is
  static const String _scheme = 'https';

  static const String _host = 'mymetickets.online';

  /// This is the api version
  static const String baseUrl = '$_scheme://$_host/api';

  /// This is the api version
  static const String _version = '/v1';

  /// This is the application base uri
  static Uri _baseUri([String? path, Map<String, dynamic>? queryParameters]) =>
      Uri(
        host: _host,
        scheme: _scheme,
        path: '/api/$path',
        queryParameters: queryParameters,
      );

  /// This is the application base uri
  static Uri _authUri([String? path, Map<String, dynamic>? queryParameters]) =>
      _baseUri('auth/$path', queryParameters);

  /// Login url getter
  static Uri get loginUri => _authUri('login');

  /// Register url getter
  static Uri get registerUri => _authUri('register');

  /// Register url getter
  static Uri verifyUri({Map<String, dynamic>? queryParameters}) => _authUri(
        'verify-account',
        queryParameters,
      );
 
  /// Register url getter
  static Uri resendVerifyUri({Map<String, dynamic>? queryParameters}) => _authUri(
        'resend-verification',
        queryParameters,
      );
}
