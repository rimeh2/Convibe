import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testconvibe/Views/Components/Footer.dart';
import 'package:testconvibe/Views/Dashboard/DashboardScreen.dart';
import 'package:testconvibe/Views/HomeScreen/CardCompanies.dart';

import '../Components/AppBar.dart';
import '../ServerSetting/ServerSetting.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget ItemAction() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: ClipOval(
        child: Image.network(
            width: 40,
            height: 40,
            "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(Title: "Companies", Action: ItemAction()),
      body: InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, DashboardScreen.routeName, (route) => false);
          },
          child: Column(
            children: [Cardcompanies(), Footer()],
          )),
    );
  }
}
