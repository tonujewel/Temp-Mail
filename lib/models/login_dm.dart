// To parse this JSON data, do
//
//     final loginDm = loginDmFromJson(jsonString);

import 'dart:convert';

LoginDm loginDmFromJson(String str) => LoginDm.fromJson(json.decode(str));

String loginDmToJson(LoginDm data) => json.encode(data.toJson());

class LoginDm {
  LoginDm({
    this.token,
    this.id,
  });

  String? token;
  String? id;

  factory LoginDm.fromJson(Map<String, dynamic> json) => LoginDm(
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
      };
}
