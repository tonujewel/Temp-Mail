// To parse this JSON data, do
//
//     final loginErrorDm = loginErrorDmFromJson(jsonString);

import 'dart:convert';

LoginErrorDm loginErrorDmFromJson(String str) => LoginErrorDm.fromJson(json.decode(str));

String loginErrorDmToJson(LoginErrorDm data) => json.encode(data.toJson());

class LoginErrorDm {
    LoginErrorDm({
        this.code,
        this.message,
    });

    int? code;
    String? message;

    factory LoginErrorDm.fromJson(Map<String, dynamic> json) => LoginErrorDm(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}
