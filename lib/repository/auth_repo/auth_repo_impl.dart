import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:jora_test/app/app.locator.dart';
import 'package:jora_test/core/constants/api_constants.dart';
import 'package:jora_test/exception/exception.dart';
import 'package:jora_test/model/request/forgot_psw_request.dart';
import 'package:jora_test/model/request/login_request.dart';
import 'package:jora_test/model/request/otp_verification.dart';
import 'package:jora_test/model/request/register_req.dart';
import 'package:jora_test/model/response/login_response.dart';
import 'package:jora_test/model/response/network_response.dart';
import 'package:jora_test/model/response/register_response.dart';
import 'package:jora_test/repository/auth_repo/auth_repo.dart';
import 'package:jora_test/service/network_service/network_service.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  final _networkService = locator<NetworkService>();
  @override
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      forgotPassword({required ForgotPasswordRequest body}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NetworkResponse<BaseResponse<LoginResponse>>>> login(
      {required LoginRequest body}) async {
    // TODO: implement login
    // TODO: implement login
    final response = await _networkService.postUrl<Map<String, dynamic>>(
      uri: ApiData.loginUri,
      body: body.toMap(),
    );

    return response.fold((l) {
      return Left(l);
    }, (networkResponse) {
      final result = (networkResponse.data);
      log('{Login result} = $result');
      final baseResp = BaseResponse<LoginResponse>(
        data: LoginResponse(),
        message: networkResponse.data!['message'],
        code: networkResponse.data!['status'],
      );
      return Right(
        NetworkResponse<BaseResponse<LoginResponse>>(
          statusMessage: networkResponse.statusMessage,
          statusCode: networkResponse.statusCode,
          data: baseResp,
        ),
      );
    });
  }

  @override
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      register({required RegisterRequest body}) async {
    // TODO: implement register
    final response = await _networkService.postUrl<Map<String, dynamic>>(
      uri: ApiData.registerUri,
      body: body.toMap(),
    );

    return response.fold((l) {
      return Left(l);
    }, (networkResponse) {
      final result = (networkResponse.data);
      log('{registerresult} = $result');
      final baseResp = BaseResponse<TokenResponse>(
        data: TokenResponse.fromMap(
            (networkResponse.data!['data'] as Map<String, dynamic>)),
        message: networkResponse.data!['message'],
        code: networkResponse.data!['status'],
      );
      return Right(
        NetworkResponse<BaseResponse<TokenResponse>>(
          statusMessage: networkResponse.statusMessage,
          statusCode: networkResponse.statusCode,
          data: baseResp,
        ),
      );
    });
  }

  @override
  Future<Either<Failure, NetworkResponse<BaseResponse<List<dynamic>>>>> verify({
    required OtpVerification body,
    TokenResponse? tokenResponse,
  }) async {
    // TODO: implement register
    final response = await _networkService.postUrl<Map<String, dynamic>>(
      uri: ApiData.verifyUri(
        queryParameters: {
          'token': tokenResponse?.token ?? '',
        },
      ),
      body: body.toMap(),
    );

    return response.fold((l) {
      return Left(l);
    }, (networkResponse) {
      final result = (networkResponse.data);
      log('{registerresult} = $result');
      final baseResp = BaseResponse<List<dynamic>>(
        data: [],
        message: networkResponse.data!['message'],
        code: networkResponse.data!['status'],
      );
      return Right(
        NetworkResponse<BaseResponse<List<dynamic>>>(
          statusMessage: networkResponse.statusMessage,
          statusCode: networkResponse.statusCode,
          data: baseResp,
        ),
      );
    });
  }

  @override
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      resendVerificationEmail(
    TokenResponse? tokenResponse,
  ) async {
    final response = await _networkService.getUrl<Map<String, dynamic>>(
      uri: ApiData.verifyUri(
        queryParameters: {
          'token': tokenResponse?.token ?? '',
        },
      ),
    );

    return response.fold((l) {
      return Left(l);
    }, (networkResponse) {
      final result = (networkResponse.data);
      final baseResp = BaseResponse<TokenResponse>(
        data: TokenResponse.fromMap(
            networkResponse.data!['data'] as Map<String, dynamic>),
        message: networkResponse.data!['message'],
        code: networkResponse.data!['status'],
      );
      return Right(
        NetworkResponse<BaseResponse<TokenResponse>>(
          statusMessage: networkResponse.statusMessage,
          statusCode: networkResponse.statusCode,
          data: baseResp,
        ),
      );
    });
  }
}
