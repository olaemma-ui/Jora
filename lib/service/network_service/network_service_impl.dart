import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jora_test/core/constants/api_constants.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/utils/app.route.dart';
import 'package:jora_test/exception/error_message.dart';
import 'package:jora_test/exception/exception.dart';
import 'package:jora_test/interceptor/request_interceptor.dart';
import 'package:jora_test/model/response/network_response.dart';
import 'package:jora_test/service/network_service/network_service.dart';

class NetworkServiceImpl extends NetworkService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiData.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'Accept': 'application/json',
      },
    ),
  );

  NetworkServiceImpl() {
    _dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
  }

  @override
  Future<Either<Failure, NetworkResponse<T>>> deleteUrl<T>({
    required Uri uri,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    // TODO: implement deleteUrl
    try {
      final response = await _dio.deleteUri<T>(
        uri,
        data: FormData.fromMap(body),
        options: Options(headers: headers),
      );

      return Right(
        NetworkResponse<T>(
          data: response.data as T,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
        ),
      );
    } on DioException catch (error) {
      return Left(_handleApiError(error));
    }
  }

  @override
  Future<Either<Failure, NetworkResponse<T>>> getUrl<T>({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    // TODO: implement getUrl
    try {
      final response = await _dio.getUri<T>(
        uri,
        options: Options(headers: headers),
      );

      return Right(
        NetworkResponse<T>(
          data: response.data as T,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
        ),
      );
    } on DioException catch (error) {
      return Left(_handleApiError(error));
    }
  }

  @override
  Future<Either<Failure, NetworkResponse<T>>> postUrl<T>({
    required Uri uri,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    // TODO: implement postUrl
    try {
      log('body = $body');

      final response = await _dio.postUri<T>(
        uri,
        data: body == null ? null : FormData.fromMap(body),
        options: Options(headers: headers),
      );

      log('resp = $response');
      // log('Generic T = $T');

      return Right(
        NetworkResponse<T>(
          data: response.data as T,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
        ),
      );
    } on DioException catch (error) {
      // log('error = $error');
      log('error type = ${error.type}');
      return Left(_handleApiError(error));
    }
  }

  @override
  Future<Either<Failure, NetworkResponse<T>>> putUrl<T>({
    required Uri uri,
    dynamic body,
    Map<String, String>? headers,
    List<Map<String, File>>? files,
  }) async {
    // TODO: implement putUrl
    try {
      final response = await _dio.putUri<T>(
        uri,
        data: FormData.fromMap(body),
        options: Options(headers: headers),
      );

      return Right(
        NetworkResponse<T>(
          data: response.data as T,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
        ),
      );
    } on DioException catch (error) {
      return Left(_handleApiError(error));
    }
  }

  Failure _handleApiError(DioException dioError) {
    try {
      log('dio error ${dioError} ${dioError.requestOptions.uri}');
      String? errorMessage = (dioError.response?.data
          as Map<String, dynamic>?)?['message'] as String?;

      if (dioError.response?.statusCode == 404) {
        return FormValidationError<dynamic>(
          prettyMessage: errorMessage ?? 'Not Found',
          devMessage: '${dioError.message.toString()} $errorMessage',
          data: (dioError.response?.data as Map<String, dynamic>?)?['data'],
        );
      }

      if (dioError.response?.statusCode == 401) {
        return FormValidationError<List<dynamic>>(
          prettyMessage: errorMessage ?? 'Invalid credentials',
          devMessage: '${dioError.message.toString()} $errorMessage',
          data: (dioError.response?.data as Map<String, dynamic>?)?['data'],
        );
      }

      if (dioError.response?.statusCode == 406) {
        return AccountNotVerifiedException<Map<String, dynamic>>(
          prettyMessage: errorMessage ?? 'Not Verified',
          devMessage: '${dioError.message.toString()} $errorMessage',
          code: dioError.response?.statusCode,
          data: (dioError.response?.data as Map<String, dynamic>?)?['data'],
        );
      }

      if (dioError.response?.statusCode == 403) {
        return FormValidationError<Map<String, dynamic>>(
          prettyMessage: errorMessage ?? 'Access denied',
          devMessage: '${dioError.message.toString()} $errorMessage',
          data: (dioError.response?.data as Map<String, dynamic>?)?['data'],
        );
      }
      if (dioError.error is SocketException) {
        return NoInternetException(
          prettyMessage: noInternet,
          devMessage:
              dioError.message.toString() + dioError.stackTrace.toString(),
        );
      }
      if (dioError.error is FormatException) {
        return BadFormatException(
          prettyMessage: errorMessage ?? somethingWentWrong,
          devMessage:
              dioError.message.toString() + dioError.stackTrace.toString(),
        );
      }

      switch (dioError.type) {
        case DioExceptionType.connectionError:
          return NoInternetException(
            prettyMessage: noInternet,
            devMessage:
                dioError.message.toString() + dioError.stackTrace.toString(),
          );
        case DioExceptionType.connectionTimeout:
          return ClientNetworkException(
            prettyMessage: connectionTimedOut,
            devMessage:
                dioError.message.toString() + dioError.stackTrace.toString(),
          );

        case DioExceptionType.sendTimeout:
          return ClientNetworkException(
            prettyMessage: sendTimeOut,
            devMessage:
                dioError.message.toString() + dioError.stackTrace.toString(),
          );

        case DioExceptionType.receiveTimeout:
          return ServerNetworkException(
            prettyMessage: receiveTimeOut,
            devMessage:
                dioError.message.toString() + dioError.stackTrace.toString(),
            code: dioError.response?.statusCode,
          );

        case DioExceptionType.badResponse:
          return BadFormatException(
            prettyMessage: errorMessage ?? somethingWentWrong,
            devMessage: errorMessage ??
                dioError.message.toString() + dioError.stackTrace.toString(),
            code: dioError.response?.statusCode,
          );

        case DioExceptionType.cancel:
          return RequestCancelledException(
            prettyMessage: requestCancelled,
            devMessage:
                dioError.message.toString() + dioError.stackTrace.toString(),
            code: dioError.response?.statusCode,
          );
        case DioExceptionType.unknown:
        case DioExceptionType.badCertificate:
          return UnknownException(
            prettyMessage: somethingWentWrong,
            devMessage: 'Dev Message',
            // errorMessage ??
            //     (dioError.message?.toString() ?? '') +
            //         dioError.stackTrace.toString(),
            code: dioError.response?.statusCode,
          );
      }
    } catch (e, s) {
      log('e, s = $e $s');
      return UnknownException(
        prettyMessage: somethingWentWrong,
        devMessage: e.toString() + s.toString(),
        code: dioError.response?.statusCode,
      );
    }
  }
}
