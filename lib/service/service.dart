import 'package:dropdown/model/datamodel.dart';
import 'package:http/http.dart' as http;
class Services {
  //
  static const String url = 'assets/cars.json';

  Services(String body);
  static Future<Object> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final Services users = Services(response.body);
        return users;
      } else {
        return <Cars>[];
      }
    } catch (e) {
      return <Cars>[];
    }
  }
}