import 'package:dartz/dartz.dart';
import 'package:jora_test/exception/exception.dart';
import 'package:jora_test/model/request/forgot_psw_request.dart';
import 'package:jora_test/model/request/login_request.dart';
import 'package:jora_test/model/request/otp_verification.dart';
import 'package:jora_test/model/request/register_req.dart';
import 'package:jora_test/model/response/login_response.dart';
import 'package:jora_test/model/response/network_response.dart';
import 'package:jora_test/model/response/register_response.dart';

abstract class AuthenticationRepo {
  /// This method is called in the auth service to log users in
  /// [body] This contains the user email and password field
  /// to be sent to the server
  Future<Either<Failure, NetworkResponse<BaseResponse<LoginResponse>>>> login({
    required LoginRequest body,
  });

  /// This method is called in the auth service for new users.
  /// [body] This contains the user name, email and password field
  /// to be sent to the server.
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      register({
    required RegisterRequest body,
  });

  /// This method is called in the auth service for new users.
  /// [body] This contains the user name, email and password field
  /// to be sent to the server.
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      resendVerificationEmail(TokenResponse? tokenResponse,);

  /// This method is called in the auth service for new users.
  /// [body] This contains the user name, email and password field
  /// to be sent to the server.
  Future<Either<Failure, NetworkResponse<BaseResponse<List<dynamic>>>>> verify({
    required OtpVerification body,
    TokenResponse tokenResponse,
  });

  /// This method is called in the auth service if user forget their password.
  /// [body] This contains the user name, email and password field
  /// to be sent to the server.
  Future<Either<Failure, NetworkResponse<BaseResponse<TokenResponse>>>>
      forgotPassword({
    required ForgotPasswordRequest body,
  });
}
