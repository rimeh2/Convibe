import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Authentication/RequestAuthentication.dart';
import '../Model/Authentication/ResponseAuthentication.dart';
import '../env.dart';
import 'package:http/http.dart' as http;

String urlApi = Environment.API_URL;
Future<ResponseAuthentication?> authenticate(
    RequestAuthentication loginModel) async {
  var url = Uri.parse('$urlApi/api/token/');

  SharedPreferences prefs = await SharedPreferences.getInstance();

  final body = jsonEncode(loginModel);
  http.Response response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body);
  if (response.statusCode == 200) {
    print("secc");
    print(response.body);
    var jsonData = jsonDecode(response.body);
    ResponseAuthentication authModel =
        ResponseAuthentication.fromJson(jsonData);

    print("this is response from service");
    print(authModel);
    if (authModel.data?.access != null) {
      prefs.setString('token', authModel.data!.access!);
      print("token ");
      print(authModel);
      String yourToken = "Your JWT";
    }

    return authModel;
  } else {
    ResponseAuthentication authModelResponse = ResponseAuthentication();
    authModelResponse.status = false;
    authModelResponse.message = "Enter a valid email address.";
    var jsonData = response.body;
    print("this is json data ");
    print(jsonData);
    // final String responseString = utf8.decode(response.bodyBytes);
    // _showMyDialogForError(context, responseString);
    return authModelResponse;
  }
}
