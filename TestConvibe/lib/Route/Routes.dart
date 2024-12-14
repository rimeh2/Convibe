import 'package:flutter/cupertino.dart';

import '../Views/CompanyInfo/AbsenteesPage.dart';
import '../Views/CompanyInfo/Documents.dart';
import '../Views/CompanyInfo/EmployeePage.dart';
import '../Views/CompanyInfo/InfoScreen.dart';
import '../Views/CompanyInfo/OffDutyPage.dart';
import '../Views/CompanyInfo/Profile.dart';
import '../Views/CompanyInfo/RenewalsPage.dart';
import '../Views/CompanyInfo/SalariesPage.dart';
import '../Views/Dashboard/DashboardScreen.dart';
import '../Views/Employee/DetailsEmployee.dart';
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
  Infoscreen.routeName: (context) => Infoscreen(),
  AbsenteesPage.routeName: (context) => AbsenteesPage(),
  EmployeePage.routeName: (context) => EmployeePage(),
  OffDutyPage.routeName: (context) => OffDutyPage(),
  RenewalsPage.routeName: (context) => RenewalsPage(),
  SalariesPage.routeName: (context) => SalariesPage(),
  Documents.routeName: (context) => Documents(),
  Profile.routeName: (context) => Profile(),
};
