// To parse this JSON data, do
//
//     final emailDm = emailDmFromJson(jsonString);

import 'dart:convert';

EmailDm emailDmFromJson(String str) => EmailDm.fromJson(json.decode(str));

String? emailDmToJson(EmailDm data) => json.encode(data.toJson());

class EmailDm {
  EmailDm({
    this.context,
    this.id,
    this.type,
    this.hydraMember,
    this.hydraTotalItems,
  });

  String? context;
  String? id;
  String? type;
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;

  factory EmailDm.fromJson(Map<String?, dynamic> json) => EmailDm(
        context: json["@context"],
        id: json["@id"],
        type: json["@type"],
        hydraMember: List<HydraMember>.from(
            json["hydra:member"].map((x) => HydraMember.fromJson(x))),
        hydraTotalItems: json["hydra:totalItems"],
      );

  Map<String?, dynamic> toJson() => {
        "@context": context,
        "@id": id,
        "@type": type,
        "hydra:member": List<dynamic>.from(hydraMember!.map((x) => x.toJson())),
        "hydra:totalItems": hydraTotalItems,
      };
}

class HydraMember {
  HydraMember({
    this.id,
    this.type,
    this.hydraMemberId,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? type;
  String? hydraMemberId;
  String? accountId;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory HydraMember.fromJson(Map<String?, dynamic> json) => HydraMember(
        id: json["@id"],
        type: json["@type"],
        hydraMemberId: json["id"],
        accountId: json["accountId"],
        msgid: json["msgid"],
        from: From.fromJson(json["from"]),
        to: List<From>.from(json["to"].map((x) => From.fromJson(x))),
        subject: json["subject"],
        intro: json["intro"],
        seen: json["seen"],
        isDeleted: json["isDeleted"],
        hasAttachments: json["hasAttachments"],
        size: json["size"],
        downloadUrl: json["downloadUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String?, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": hydraMemberId,
        "accountId": accountId,
        "msgid": msgid,
        "from": from!.toJson(),
        "to": List<dynamic>.from(to!.map((x) => x.toJson())),
        "subject": subject,
        "intro": intro,
        "seen": seen,
        "isDeleted": isDeleted,
        "hasAttachments": hasAttachments,
        "size": size,
        "downloadUrl": downloadUrl,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt,
      };
}

class From {
  From({
    this.address,
    this.name,
  });

  String? address;
  String? name;

  factory From.fromJson(Map<String?, dynamic> json) => From(
        address: json["address"],
        name: json["name"],
      );

  Map<String?, dynamic> toJson() => {
        "address": address,
        "name": name,
      };
}
