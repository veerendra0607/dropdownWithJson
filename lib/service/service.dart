import 'dart:convert';

import 'package:dropdown/model/datamodel.dart';
import 'package:flutter/services.dart';

class Services {
  CarModel? cardetails;
  List<CarModel> users = [];

  Future<void> fetchData() async {
    String jsonContent = await rootBundle.loadString("assets/cars.json");
    dynamic decodedJson = json.decode(jsonContent);
    cardetails = carModelFromJson(decodedJson);
  }
}