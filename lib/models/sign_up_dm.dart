// To parse this JSON data, do
//
//     final signUpDm = signUpDmFromJson(jsonString);

import 'dart:convert';

SignUpDm signUpDmFromJson(String str) => SignUpDm.fromJson(json.decode(str));

String signUpDmToJson(SignUpDm data) => json.encode(data.toJson());

class SignUpDm {
    SignUpDm({
        this.context,
        this.id,
        this.type,
        this.signUpDmId,
        this.address,
        this.quota,
        this.used,
        this.isDisabled,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
    });

    String ?context;
    String ?id;
    String ?type;
    String ?signUpDmId;
    String ?address;
    int ?quota;
    int ?used;
    bool? isDisabled;
    bool ?isDeleted;
    DateTime ?createdAt;
    DateTime ?updatedAt;

    factory SignUpDm.fromJson(Map<String, dynamic> json) => SignUpDm(
        context: json["@context"],
        id: json["@id"],
        type: json["@type"],
        signUpDmId: json["id"],
        address: json["address"],
        quota: json["quota"],
        used: json["used"],
        isDisabled: json["isDisabled"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@id": id,
        "@type": type,
        "id": signUpDmId,
        "address": address,
        "quota": quota,
        "used": used,
        "isDisabled": isDisabled,
        "isDeleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}
