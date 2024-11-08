import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:testconvibe/Views/Components/Footer.dart';
import 'package:testconvibe/Views/Login/login.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/colors.dart';
import '../HomeScreen/Home.dart';

class SplashScreen extends StatefulWidget {
  //route name for our screen
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(Duration(seconds: 10));
    bool tokenExists = await _checkToken();

    if (tokenExists) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Login.routeName, (route) => false);
    }
  }

  Future<bool> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Image.asset(
              'assets/images/synergia_logo.png',
              height: 25.h,
              width: 50.w,
            ),
            // Title text at the top

            SizedBox(height: 8.h), // Spacer for equal margin

            Text(
              'SYNERGIA',
              style: GoogleFonts.kodchasan(
                textStyle: TextStyle(
                  fontSize: 48,
                  color: BaseColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25.h), // Spacer for equal margin

            // Footer text
            Footer()
          ],
        ),
      ),
    );
  }
}
