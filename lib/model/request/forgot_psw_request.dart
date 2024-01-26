import 'dart:convert';

class ForgotPasswordRequest {
    final String? email;

    ForgotPasswordRequest({
        this.email,
    });

    ForgotPasswordRequest copyWith({
        String? email,
    }) => 
        ForgotPasswordRequest(
            email: email ?? this.email,
        );

    factory ForgotPasswordRequest.fromJson(String str) => ForgotPasswordRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ForgotPasswordRequest.fromMap(Map<String, dynamic> json) => ForgotPasswordRequest(
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
    };
}
