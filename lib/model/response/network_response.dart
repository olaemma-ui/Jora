// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class NetworkResponse<T> extends Equatable {
  /// This is the message from the api
  final String? statusMessage;

  /// This is the statusCode from the api
  final int? statusCode;

  /// This is the data from the api
  final T? data;

  const NetworkResponse({
    required this.statusMessage,
    required this.statusCode,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data, statusMessage, statusCode];
}

class BaseResponse<T> extends Equatable{
  const BaseResponse({
    required this.data,
    required this.message,
    required this.code,
  });

  final String message;
  final String code;
  final T? data;
  
  @override
  // TODO: implement props
  List<Object?> get props => [data, code, message];
}
