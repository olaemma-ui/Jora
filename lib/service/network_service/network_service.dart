import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:jora_test/exception/exception.dart';
import 'package:jora_test/model/response/network_response.dart';

/// This service handles all the api request
abstract class NetworkService {
  /// This methods sends a post request to the provided [Uri].
  /// [T]: this is the expected data type from from the request.
  /// Returns either a failure on the left or the data on the right.
  Future<Either<Failure, NetworkResponse<T>>> postUrl<T>({
    required Uri uri,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  /// This methods sends a post request to the provided [Uri].
  /// [T]: this is the expected data type from from the request.
  /// Returns either a failure on the left or the data on the right.
  Future<Either<Failure, NetworkResponse<T>>> getUrl<T>({
    required Uri uri,
    Map<String, String>? headers,
  });

  /// This methods sends a post request to the provided [Uri].
  /// [T]: this is the expected data type from from the request.
  /// Returns either a failure on the left or the data on the right.
  Future<Either<Failure, NetworkResponse<T>>> putUrl<T>({
    required Uri uri,
    dynamic body,
    List<Map<String, File>>? files,
    Map<String, String>? headers,
  });

  /// This methods sends a post request to the provided [Uri].
  /// [T]: this is the expected data type from from the request.
  /// Returns either a failure on the left or the data on the right.
  Future<Either<Failure, NetworkResponse<T>>> deleteUrl<T>({
    required Uri uri,
    dynamic body,
    Map<String, String>? headers,
  });
}
