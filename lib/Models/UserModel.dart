// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.address,
    this.email,
    this.matrimonial,
    this.name,
    this.phone,
    this.profileimage,
    this.status,
    this.type,
    this.uid,
  });

  String address;
  String email;
  String matrimonial;
  String name;
  String phone;
  String profileimage;
  String status;
  String type;
  String uid;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    address: json["address"],
    email: json["email"],
    matrimonial: json["matrimonial"],
    name: json["name"],
    phone: json["phone"],
    profileimage: json["profileimage"],
    status: json["status"],
    type: json["type"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "email": email,
    "matrimonial": matrimonial,
    "name": name,
    "phone": phone,
    "profileimage": profileimage,
    "status": status,
    "type": type,
    "uid": uid,
  };
}
