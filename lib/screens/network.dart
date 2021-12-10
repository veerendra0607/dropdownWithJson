import 'package:dropdown/model/datamodel.dart';
import 'package:flutter/material.dart';


class NetworkDropDown extends StatefulWidget {
  @override
  _NetworkDropDownState createState() => _NetworkDropDownState();
}

class _NetworkDropDownState extends State<NetworkDropDown> {
List<CarModel> carmodel=[];
List<Nissan> nissancar=[];
List<Ford> fordcar=[];

 Future<CarModel> fetchData(BuildContext context) async{
   final jsonString=await DefaultAssetBundle.of(context).loadString("assets/cars.json");
   print("======================="+jsonString);
   return carModelFromJson(jsonString);

 }
  CarModel? cardetails;

  Nissan? selectedNissan;
  Ford? SelectedFord;
  //
  // List<CarModel> Nissan = [];
  // List<CarModel> Ford = [];

  @override
  void initState() {
    super.initState();
    fetchData(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Multi Level Dropdown'),
      ),
      body: Column(
   children: [
     if(carmodel.length > 0)

         ListView.builder(
         itemCount: carmodel.length,
         itemBuilder: (BuildContext context, index){
           return ListTile(title: Text(carmodel[index].toString()));
       },
    )

     else
       Center(child: CircularProgressIndicator())

   ],
      )
      // FutureBuilder(
      //   future: fetchData(context),
      //   builder: (context,snapshot){
      //     if(snapshot.hasData) {
      //       return ListView.builder(
      //         padding: EdgeInsets.all(20.0),
      //         itemCount: snapshot.data.toString().length,
      //         itemBuilder: (BuildContext context, int index){
      //           CarModel items=snapshot.data.toString()[index].toString() as CarModel;
      //           return
      //
      //           ListView(
      //             padding: EdgeInsets.all(20.0),
      //             children: [
      //               // State Dropdown
      //               DropdownButton<CarModel>(
      //                 hint: Text('Select Car'),
      //                 value: SelectedFord,
      //                 isExpanded: true,
      //                 items: Nissan.map((CarModel value) {
      //                   return DropdownMenuItem<CarModel>(
      //                     value: value,
      //                     child: Text(value.toString()),
      //                   );
      //                 }).toList(),
      //                 onChanged: onStateChange,
      //               ),
      //               // State Dropdown Ends here
      //               SizedBox(height: 60.0),
      //               // Districts Dropdown
      //               DropdownButton<CarModel>(
      //                 hint: Text('Related Car'),
      //                 value: items,
      //                 isExpanded: true,
      //                 items: items.map((CarModel fordcars) {
      //                   return DropdownMenuItem<CarModel>(
      //                     value: fordcars,
      //                     child: Text(items.cars!.ford!.length.toString()),
      //                   );
      //                 }).toList(),
      //                 onChanged: onDistrictChange,
      //               ),
      //               // Districts Dropdown Ends here
      //             ],
      //           );
      //         },
      //
      //       );
      //     }
      //     else{
      //       return  Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   }
      //
      // )



      // ListView(
      //   padding: EdgeInsets.all(20.0),
      //   children: [
      //     // State Dropdown
      //     DropdownButton<CarsDataModel>(
      //       hint: Text('Select Car'),
      //       value: SelectedFord,
      //       isExpanded: true,
      //       items: Nissan.map((CarsDataModel value) {
      //         return DropdownMenuItem<CarsDataModel>(
      //           value: value,
      //           child: Text(value.toString()),
      //         );
      //       }).toList(),
      //       onChanged: onStateChange,
      //     ),
      //     // State Dropdown Ends here
      //     SizedBox(height: 60.0),
      //     // Districts Dropdown
      //     DropdownButton<CarsDataModel>(
      //       hint: Text('Related Car'),
      //       value: SelectedFord,
      //       isExpanded: true,
      //       items: Ford.map((CarsDataModel fordcars) {
      //         return DropdownMenuItem<CarsDataModel>(
      //           value: fordcars,
      //           child: Text(Ford.length.toString()),
      //         );
      //       }).toList(),
      //       onChanged: onDistrictChange,
      //     ),
      //     // Districts Dropdown Ends here
      //   ],
      // ),
    );
  }

  void onStateChange(state) {
    setState(() {
      nissancar = state;
      nissancar = [];
      selectedNissan = null;
    });
    String endpoint = "${selectedNissan!.model}";
    selectedNissan!.then((List<Nissan> value) {
      setState(() {
        selectedNissan = value as Nissan?;
      });
    });
  }

  void onDistrictChange(district) {
    setState(() {
      selectedNissan = district;
    });
  }
  
}