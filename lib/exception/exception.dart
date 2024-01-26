import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// This [Failure] class to all types of exception or failuer may occure
/// [Failure] will always be used on the left of an [Either]
/// All Exception should extend this class
abstract interface class Failure extends Equatable implements Exception {
  /// [devMessage] This is the message that the developer sees on the logs.
  final String devMessage;

  /// [prettyMessage] This is the message displayed to the user.
  final String prettyMessage;

  /// [stackTrace] This is the entire stacktrace of the error occurred.
  final StackTrace stackTrace;

  final int? code;

  const Failure({
    required this.devMessage,
    required this.prettyMessage,
    this.code,
    this.stackTrace = StackTrace.empty,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [prettyMessage, devMessage, stackTrace];
}

/// This Exception is thrown on no internet exception
/// Extends [Failure] class.
class NoInternetException extends Failure {
  const NoInternetException({
    required super.devMessage,
    required super.prettyMessage,
    super.stackTrace,
  });
}

/// This exception is thrown when the user account already exists.
final class AccountAlreadyExistsException extends Failure {
  /// This is the constructor of the [AccountAlreadyExistsException] class.
  const AccountAlreadyExistsException({
    required super.prettyMessage,
    required super.devMessage,
    super.stackTrace,
    required super.code,
  });
}

/// This exception is thrown when the user is not verified.
final class AccountNotVerifiedException<T> extends Failure {
  /// This is the constructor of the [AccountNotVerifiedException] class.
  const AccountNotVerifiedException({
    required super.prettyMessage,
    required super.devMessage,
    super.stackTrace,
    required super.code,
    this.data,
  });

  final T? data;
}

/// This exception is thrown when the user is not authenticated.
/// It is typically thrown when the authentication information are invalid.
final class AuthenticationException extends Failure {
  /// This is the constructor of the [AuthenticationException] class.
  const AuthenticationException({
    required super.prettyMessage,
    required super.devMessage,
    super.stackTrace,
  });
}

/// This exceptions when there is a recieve timeout exception.
/// It is typically thrown when the client doesn't respond during
/// the specified timesplice.
final class ClientNetworkException extends Failure {
  /// This is the constructor of the [ClientNetworkException]  class.
  const ClientNetworkException({
    required super.prettyMessage,
    required super.devMessage,
    super.stackTrace,
  });
}

/// This exception is thrown when the server returns a bad reponse,
/// or the user sends a bad request.
final class BadFormatException extends Failure {
  /// This is the constructor of the [BadFormatException]  class.
  const BadFormatException({
    required super.prettyMessage,
    required super.devMessage,
    this.code,
    super.stackTrace,
  });

  /// status code of the error.
  final int? code;
}

/// This exception is thrown when the server returns a bad reponse,
/// or the user sends a bad request.
final class FormValidationError<T> extends Failure {
  /// This is the constructor of the [FormValidationError]  class.
  const FormValidationError({
    required super.prettyMessage,
    required super.devMessage,
    this.data,
    super.stackTrace,
  });

  final T? data;
}

/// This exception is thrown when the server returns a 404 error.
/// Also when the type of error cannot be determined.
final class UnknownException extends Failure {
  /// This is the constructor of the [UnknownException]  class.
  const UnknownException({
    required super.prettyMessage,
    required super.devMessage,
    required this.code,
    super.stackTrace,
  });

  /// status code of the error.
  final int? code;
}

/// This exception is thrown when the server returns a 500 error.
/// It is typically thrown when the server is down.
/// This exception can when the server doesn't respond within the timesplice.
final class ServerNetworkException extends Failure {
  /// This is the constructor of the [ServerNetworkException]  class.
  const ServerNetworkException({
    required super.prettyMessage,
    required super.devMessage,
    required this.code,
    super.stackTrace,
  });

  /// status code of the error.
  final int? code;
}

/// This exception is thrown when the requested cached data is not found.
final class CacheException extends Failure {
  /// This is the constructor of the [CacheException]  class.
  const CacheException({
    required super.prettyMessage,
    required super.devMessage,
    super.stackTrace,
  });
}

/// This exception is thrown when the requested cached data is not found.
final class RequestCancelledException extends Failure {
  /// This is the constructor of the [RequestCancelledException]  class.
  const RequestCancelledException({
    required super.prettyMessage,
    required super.devMessage,
    required this.code,
    super.stackTrace,
  });

  /// status code of the error.
  final int? code;
}
