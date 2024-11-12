import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Company/ConpanyResponse.dart';
import 'package:http/http.dart' as http;

import '../Model/Company/dashbordCompany.dart';
import '../env.dart';

String? token;
String urlApi = Environment.API_URL;
Future<List<Company>> getListCOMPANY() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  var Response = await http.get(
    Uri.parse('$urlApi/company/api/companies/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    String body = utf8.decode(Response.bodyBytes);
    final data = jsonDecode(body);
    print("Company data");
    print(data);

    print(responseString);
//String ss = data.substring(1,responseString.length-1);
    // List<String> result = ss.split(',').toList();
    //print("this is resulrt"+result.toString());
    return data.map<Company>((json) => Company.fromJson(json)).toList();
  } else {
    throw ("Can't get the value");
  }
}

Future<DashbordCompany?> Dashbord(int id) async {
  // Retrieve the token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token'); // Make sure token is not null

  // Handle case if the token is null
  if (token == null) {
    print("Token is null, user might not be logged in.");
    return null;
  }

  // Define the URL and pass the dynamic company ID
  var url =
      Uri.parse('http://64.225.59.65/company/api/company_dashboard_view/$id/');

  try {
    // Make the HTTP request
    http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // Parse the response to a DashbordCompany object
      DashbordCompany dashbord = DashbordCompany.fromJson(jsonData);
      print(response.body); // You can remove this in production
      return dashbord;
    } else {
      // Handle error if status code is not 200
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    // Catch any exception (e.g., network issues) and log it
    print("Exception occurred: $e");
    return null;
  }
}
