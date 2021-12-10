import 'package:flutter/material.dart';

class StaticDropDown extends StatefulWidget {
  @override
  _StaticDropDownState createState() => _StaticDropDownState();
}

class _StaticDropDownState extends State<StaticDropDown> {

  List<String> Cars = ['Nissan','Ford'];
  List<String> NissanCars = ['Sentra','Maxima','Skyline'];
  List<String> FordCars = ['Taurus', 'Escort',];

  List<String> CarList = [];
  String? SelectedNissan;
  String? SelectedFord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Static Multi Level Dropdown'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // Country Dropdown
          DropdownButton<String>(
            hint: Text('Select Car'),
            value: SelectedNissan,
            isExpanded: true,
            items: Cars.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (Car) {
              if (Car == 'Nissan') {
                CarList = NissanCars;
              } else if (Car == 'Ford') {
                CarList = FordCars;
              } else {
                CarList = [];
              }
              setState(() {
                SelectedFord = null;
                SelectedNissan = Car;
              });
            },
          ),
          // Country Dropdown Ends here
          SizedBox(height: 60.0),
          // Province Dropdown
          DropdownButton<String>(
            hint: Text('Related Cars'),
            value: SelectedFord,
            isExpanded: true,
            items: CarList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (province) {
              setState(() {
                SelectedFord = province;
              });
            },
          ),
          // Province Dropdown Ends here
        ],
      ),
    );
  }
}