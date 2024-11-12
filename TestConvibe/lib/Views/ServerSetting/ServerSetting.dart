import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testconvibe/Views/Login/login.dart';
import 'package:http/http.dart' as http;

import '../../Constants/colors.dart';
import '../Components/AppBar.dart';
import '../Components/Footer.dart';
import '../Components/button.dart';

class SettingServer extends StatefulWidget {
  static String routeName = 'SettingServer';

  SettingServer({super.key});

  @override
  State<SettingServer> createState() => _SettingServerState();
}

class _SettingServerState extends State<SettingServer> {
  void _Conecter() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here (e.g., call API or authenticate)
      print("Server: ${_SERVERController.text}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  String _networkType = 'local'; // Initial selected value
  var _adresse = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _SERVERController = TextEditingController();

  final TextEditingController _PORTController = TextEditingController();

  Widget ItemAction() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black, // Black border color
          width: 0.5, // Border thickness
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_outlined), // L'icône de notre choix
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, Login.routeName, (route) => false);
        }, // La méthode à appeler lorsque l'action est déclenché
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(Title: "SYNERGIA", Action: ItemAction()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 48.0,
                left: 48,
                top: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      'Connection Type',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: BaseColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 85.0,
                left: 0,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Local Network Radio Button
                  Row(
                    children: [
                      Radio<String>(
                        value: 'local',
                        groupValue: _networkType,
                        onChanged: (String? value) {
                          setState(() {
                            _networkType = value!;
                          });
                        },
                      ),
                      Text('Local Network'),
                    ],
                  ),
                  SizedBox(width: 20), // Space between the buttons

                  // Domain Radio Button
                  Row(
                    children: [
                      Radio<String>(
                        value: 'domain',
                        groupValue: _networkType,
                        onChanged: (String? value) {
                          setState(() {
                            _networkType = value!;
                          });
                        },
                      ),
                      Text('Domain'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 48.0, left: 48, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Server',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: BaseColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Email field
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _SERVERController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        labelText: 'SERVER',
                        labelStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        hintText: "enter server adress",
                        hintStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter server Adress';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),

                    // Password field
                    TextFormField(
                      controller: _PORTController,
                      decoration: InputDecoration(
                        labelText: 'PORT',
                        labelStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        hintText: "enter port",
                        hintStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter port';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 24.0),

                    // Login button
                    GradientButton(
                      text: "Connect",
                      onPressed: _Conecter,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 48.0,
                left: 48,
                top: 20,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Note',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: BaseColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Please note that you should enable and connect to VPN services before connecting to server. Server connection will not work if you dont have a successful connection.',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: BaseColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.center,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
