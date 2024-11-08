import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testconvibe/Views/Components/AppBar.dart';
import 'package:testconvibe/Views/HomeScreen/Home.dart';

import '../../Constants/colors.dart';
import '../Components/Footer.dart';
import '../Components/button.dart';
import '../ServerSetting/ServerSetting.dart';

class Login extends StatefulWidget {
  static String routeName = 'LoginScreen';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
      // Handle login logic here (e.g., call API or authenticate)
      print("Logging in with username: ${_UsernameController.text}");
    }
  }

  Widget ItemAction() {
    return IconButton(
      icon: Icon(Icons.settings), // L'icône de notre choix
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, SettingServer.routeName, (route) => false);
      }, // La méthode à appeler lorsque l'action est déclenché
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(Title: "SYNERGIA", Action: ItemAction()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/Line.png",
                width: 246,
                height: 234,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 48.0, left: 48, top: 56),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Log In',
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
                      height: 5,
                    ),
                    TextFormField(
                      controller: _UsernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        labelText: 'USERNAME',
                        labelStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        hintText: "enter your username",
                        hintStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),

                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        hintText: "enter your password",
                        hintStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                          fontFamily: "PoppinsMedium",
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: Container(
                          width: 100, // Adjust width as needed
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              VerticalDivider(
                                color: Colors.red,
                                thickness: 1,
                              ),
                              IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                            ],
                          ),
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 24.0),

                    // Login button
                    GradientButton(
                      text: "Log In",
                      onPressed: _login,
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
            ),
          ],
        ),
      ),
    );
  }
}
