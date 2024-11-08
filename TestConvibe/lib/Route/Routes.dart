import 'package:flutter/cupertino.dart';

import '../Views/Dashboard/DashboardScreen.dart';
import '../Views/Employee/EmployeeScreen.dart';
import '../Views/HomeScreen/Home.dart';
import '../Views/Login/login.dart';
import '../Views/ServerSetting/ServerSetting.dart';
import '../Views/SplashScreen/SplashScreen.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  Login.routeName: (context) => Login(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SettingServer.routeName: (context) => SettingServer(),

  DashboardScreen.routeName: (context) => DashboardScreen(),
  Employeescreen.routeName: (context) => Employeescreen(),
};
