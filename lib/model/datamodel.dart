// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/material/dropdown.dart';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String carModelToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  CarModel({
    this.cars,
  });

  Cars? cars;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    cars: Cars.fromJson(json["cars"]),
  );

  Map<String, dynamic> toJson() => {
    "cars": cars!.toJson(),
  };

  void then(Null Function(List<CarModel> value) param0) {}

  map(DropdownMenuItem<CarModel> Function(CarModel fordcars) param0) {}
}

class Cars {
  Cars({
    this.nissan,
    this.ford,
  });

  List<Nissan>? nissan;
  List<Ford>? ford;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
    nissan: List<Nissan>.from(json["Nissan"].map((x) => Ford.fromJson(x))),
    ford: List<Ford>.from(json["Ford"].map((x) => Ford.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Nissan": List<dynamic>.from(nissan!.map((x) => x.toJson())),
    "Ford": List<dynamic>.from(ford!.map((x) => x.toJson())),
  };
}
class Nissan {
  Nissan({
    this.model,
    this.doors,
  });

  String? model;
  int? doors;

  factory Nissan.fromJson(Map<String, dynamic> json) => Nissan(
    model: json["model"],
    doors: json["doors"],
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "doors": doors,
  };

  static map(DropdownMenuItem<CarModel> Function(CarModel value) param0) {}

  void then(Null Function(List<Nissan> value) param0) {}
}
class Ford {
  Ford({
    this.model,
    this.doors,
  });

  String? model;
  int? doors;

  factory Ford.fromJson(Map<String, dynamic> json) => Ford(
    model: json["model"],
    doors: json["doors"],
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "doors": doors,
  };
}
