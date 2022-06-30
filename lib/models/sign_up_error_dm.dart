// To parse this JSON data, do
//
//     final signUpErrorDm = signUpErrorDmFromJson(jsonString);

import 'dart:convert';

SignUpErrorDm signUpErrorDmFromJson(String str) => SignUpErrorDm.fromJson(json.decode(str));

String signUpErrorDmToJson(SignUpErrorDm data) => json.encode(data.toJson());

class SignUpErrorDm {
    SignUpErrorDm({
        this.context,
        this.type,
        this.hydraTitle,
        this.hydraDescription,
    });

    String? context;
    String? type;
    String ?hydraTitle;
    String ?hydraDescription;

    factory SignUpErrorDm.fromJson(Map<String, dynamic> json) => SignUpErrorDm(
        context: json["@context"],
        type: json["@type"],
        hydraTitle: json["hydra:title"],
        hydraDescription: json["hydra:description"],
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@type": type,
        "hydra:title": hydraTitle,
        "hydra:description": hydraDescription,
    };
}

