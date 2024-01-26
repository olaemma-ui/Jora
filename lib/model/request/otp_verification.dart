import 'dart:convert';

class OtpVerification {
    final String? code;

    OtpVerification({
        this.code,
    });

    OtpVerification copyWith({
        String? code,
    }) => 
        OtpVerification(
            code: code ?? this.code,
        );

    factory OtpVerification.fromJson(String str) => OtpVerification.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OtpVerification.fromMap(Map<String, dynamic> json) => OtpVerification(
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
    };
}
