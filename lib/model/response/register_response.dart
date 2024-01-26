// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TokenResponse {
  final String? token;
  final String? resendToken;

  TokenResponse({
    this.token,
    this.resendToken,
  });

  TokenResponse copyWith({
    String? token,
    String? resendToken,
  }) =>
      TokenResponse(
        token: token ?? this.token,
        resendToken: resendToken ?? this.resendToken,
      );

  factory TokenResponse.fromJson(String str) =>
      TokenResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenResponse.fromMap(Map<String, dynamic> json) => TokenResponse(
        token: json["token"],
        resendToken: json["resendToken"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "resendToken": resendToken,
      };

  @override
  String toString() =>
      'TokenResponse(token: $token, resendToken: $resendToken)';
}
