import 'package:dropdown/screens/network.dart';
import 'package:dropdown/screens/static.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Level Demo'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Center(child: Text('WithoutJson')),
              onPressed: () => _staticDropDown(context),
            ),
            SizedBox(height: 60.0),
            RaisedButton(
              child: Center(child: Text('WithJson')),
              onPressed: () => _networkDropDown(context),
            ),
          ],
        ),
      ),
    );
  }

  void _staticDropDown(context) {
    WidgetBuilder builder = (_) => StaticDropDown();
    Route route = MaterialPageRoute(builder: builder);
    Navigator.push(context, route);
  }

  void _networkDropDown(context) {
    WidgetBuilder builder = (_) => NetworkDropDown();
    Route route = MaterialPageRoute(builder: builder);
    Navigator.push(context, route);
  }
}