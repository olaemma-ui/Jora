import 'dart:convert';

class ResetPasswordRequest {
    final String? newPassword;
    final String? confirmPassword;

    ResetPasswordRequest({
        this.newPassword,
        this.confirmPassword,
    });

    ResetPasswordRequest copyWith({
        String? newPassword,
        String? confirmPassword,
    }) => 
        ResetPasswordRequest(
            newPassword: newPassword ?? this.newPassword,
            confirmPassword: confirmPassword ?? this.confirmPassword,
        );

    factory ResetPasswordRequest.fromJson(String str) => ResetPasswordRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResetPasswordRequest.fromMap(Map<String, dynamic> json) => ResetPasswordRequest(
        newPassword: json["new_password"],
        confirmPassword: json["confirm_password"],
    );

    Map<String, dynamic> toMap() => {
        "new_password": newPassword,
        "confirm_password": confirmPassword,
    };
}
