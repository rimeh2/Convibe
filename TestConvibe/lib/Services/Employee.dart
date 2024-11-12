import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testconvibe/Model/Company/Employee.dart';

import '../env.dart';

String? token;
String urlApi = Environment.API_URL;

Future<List<Data>> getListEmployee(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  var Response = await http.get(
    Uri.parse('$urlApi/employee/api/employees_list/$id/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    final Map<String, dynamic> jsonMap = jsonDecode(responseString);

    if (jsonMap['status'] == true) {
      List<dynamic> data = jsonMap['data']; // Accessing the data array

      List<Data> employees = [];
      employees =
          data.map((employeeJson) => Data.fromJson(employeeJson)).toList();

      print(employees);
      return employees; // Now employees list should be correctly populated
    } else {
      List<Data> employees = [];
      print('Failed to retrieve employees');
      return employees;
    }
  } else {
    throw ("Can't get the value");
  }
}
