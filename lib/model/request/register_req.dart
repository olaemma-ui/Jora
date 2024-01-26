// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequest {
    final String? firstname;
    final String? lastname;
    final String? email;
    final String? phone;
    final String? countryCode;
    final String? password;
    final String? confirmPassword;

    RegisterRequest({
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.countryCode,
        this.password,
        this.confirmPassword,
    });

    RegisterRequest copyWith({
        String? firstname,
        String? lastname,
        String? email,
        String? phone,
        String? countryCode,
        String? password,
        String? confirmPassword,
    }) => 
        RegisterRequest(
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            countryCode: countryCode ?? this.countryCode,
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
        );

    factory RegisterRequest.fromJson(String str) => RegisterRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequest.fromMap(Map<String, dynamic> json) => RegisterRequest(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        countryCode: json["country_code"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
    );

    Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "country_code": countryCode,
        "password": password,
        "confirm_password": confirmPassword,
    };

  @override
  String toString() {
    return 'RegisterRequest(firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, countryCode: $countryCode, password: $password, confirmPassword: $confirmPassword)';
  }
}
