import 'dart:convert';

class BaseResponse <T>{
    final String? status;
    final String? message;
    final T? data;

    BaseResponse({
        this.status,
        this.message,
        this.data,
    });

    BaseResponse copyWith({
        String? status,
        String? message,
        T? data,
    }) => 
        BaseResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory BaseResponse.fromJson(String str) => BaseResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse<T>(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data,
    };
}
