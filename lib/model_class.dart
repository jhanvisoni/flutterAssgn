
import 'dart:convert';

class Welcome {

  String createOn;
  String updatedOn;
  int id;
  dynamic files;
  String name;
  String openTime;
  String closeTime;
  int slotTimeSize;
  Sports sports;


  Welcome({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.openTime,
    this.closeTime,
    this.slotTimeSize,
    this.sports,
  });



  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    createOn: json["createOn"],
    updatedOn:json["updatedOn"],
    id: json["id"],
    name: json["name"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    slotTimeSize: json["slotTimeSize"],
    sports: Sports.fromJson(json["sports"]),
  );


}


class Sports {

  String createOn;
  String updatedOn;
  int id;
  String name;
  String iconWhiteUrl;
  String iconBlackUrl;

  Sports({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.iconWhiteUrl,
    this.iconBlackUrl,
  });

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
    createOn: json["createOn"],
    updatedOn: json["updatedOn"],
    id: json["id"],
    name: json["name"],
    iconWhiteUrl: json["iconWhiteUrl"],
    iconBlackUrl: json["iconBlackUrl"],
  );


}



