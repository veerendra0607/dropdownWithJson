import 'package:dropdown/model/datamodel.dart';
import 'package:flutter/material.dart';


class NetworkDropDown extends StatefulWidget {
  @override
  _NetworkDropDownState createState() => _NetworkDropDownState();
}

class _NetworkDropDownState extends State<NetworkDropDown> {
  Future? myfetch;
  List data=[];

 Future<CarModel> fetchData(BuildContext context) async{

   String? jsonString=await DefaultAssetBundle.of(context).loadString("assets/cars.json");
   print("======================="+jsonString);
   setState(() {
    data = jsonString as List;
   });
   print(data);
   return carModelFromJson(jsonString);

 }
  @override
  void initState() {
    super.initState();
    myfetch = fetchData(context);
    print(myfetch);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Multi Level Dropdown'),
      ),
      body:
      FutureBuilder(
        future: myfetch,
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(20.0),
              itemCount: snapshot.data.toString().length,
              itemBuilder: (BuildContext context, int index){
                CarModel items=snapshot.data.toString()[index].toString() as CarModel;
                return

                ListView(
                  padding: EdgeInsets.all(20.0),
                  children: [
                    // State Dropdown
                    DropdownButton<CarModel>(
                      hint: Text('Select Car'),
                      value: items,
                      isExpanded: true,
                      items: data.map((item) {
                        return DropdownMenuItem<CarModel>(
                          value: item['model'],
                          child: Text(item['model']),
                        );
                      }).toList(),
                      onChanged: (newvalue){
                        setState(() {

                        });
                      },
                    ),
                    // State Dropdown Ends here
                    SizedBox(height: 60.0),
                    // Districts Dropdown
                    // DropdownButton<CarModel>(
                    //   hint: Text('Related Car'),
                    //   value: items,
                    //   isExpanded: true,
                    //   items: items.map((CarModel fordcars) {
                    //     return DropdownMenuItem<CarModel>(
                    //       value: fordcars,
                    //       child: Text(items.cars!.ford!.length.toString()),
                    //     );
                    //   }).toList(),
                    //   onChanged:(newvalue){
                    //     setState(() {
                    //
                    //     });
                    //   } ,
                    // ),
                    // Districts Dropdown Ends here
                  ],
                );
              },

            );
          }
          else{
            return  Center(
              child: CircularProgressIndicator(),
            );
          }
        }

      )

    );
  }

  // void onStateChange(state) {
  //   setState(() {
  //     nissancar = state;
  //     nissancar = [];
  //     selectedNissan = null;
  //   });
  //   String endpoint = "${selectedNissan!.model}";
  //   selectedNissan!.then((List<Nissan> value) {
  //     setState(() {
  //       selectedNissan = value as Nissan?;
  //     });
  //   });
  // }
  //
  // void onCarChange(district) {
  //   setState(() {
  //     selectedNissan = district;
  //   });
  // }

}