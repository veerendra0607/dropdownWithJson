import 'dart:convert';
import 'package:dropdown/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkDropDown extends StatefulWidget {
  @override
  _NetworkDropDownState createState() => _NetworkDropDownState();
}

class _NetworkDropDownState extends State<NetworkDropDown> {
  final String baseURL = "assets/cars.json";

  CarsDataModel? selectedNissan;
  CarsDataModel? SelectedFord;

  List<CarsDataModel> Nissan = [];
  List<CarsDataModel> Ford = [];

  @override
  void initState() {
    super.initState();
    // On Page Load Get all the states from the server
    String endpoint = "$baseURL/api/pin";
    // listState(endpoint).then((List<CarsDataModel> value) {
    //   setState(() {
    //     Nissan = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Multi Level Dropdown'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // State Dropdown
          DropdownButton<CarsDataModel>(
            hint: Text('Select Car'),
            value: SelectedFord,
            isExpanded: true,
            items: Nissan.map((CarsDataModel value) {
              return DropdownMenuItem<CarsDataModel>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: onStateChange,
          ),
          // State Dropdown Ends here
          SizedBox(height: 60.0),
          // Districts Dropdown
          DropdownButton<CarsDataModel>(
            hint: Text('Related Car'),
            value: SelectedFord,
            isExpanded: true,
            items: Ford.map((CarsDataModel fordcars) {
              return DropdownMenuItem<CarsDataModel>(
                value: fordcars,
                child: Text(Ford.length.toString()),
              );
            }).toList(),
            onChanged: onDistrictChange,
          ),
          // Districts Dropdown Ends here
        ],
      ),
    );
  }

  void onStateChange(state) {
    setState(() {
      selectedNissan = state;
      Ford = [];
      selectedNissan = null;
    });
    String endpoint = "$baseURL/api/pin/${selectedNissan!.cars}";
    selectedNissan!.then((List<CarsDataModel> value) {
      setState(() {
        selectedNissan = value as CarsDataModel?;
      });
    });
  }

  void onDistrictChange(district) {
    setState(() {
      selectedNissan = district;
    });
  }

  // Future<List<CarsDataModel>> listCars(String? endpoint) async {
  //   http.Response response = await http.get(endpoint);
  //   String body = response.body;
  //   Map<String, dynamic> jsonResponse = json.decode(body);
  //   List data = jsonResponse['data'];
  //   return data.map((e) => PostOffice.fromJson(e)).toList();
  // }
}