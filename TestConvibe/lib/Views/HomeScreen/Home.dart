import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testconvibe/Services/Company.dart';
import 'package:testconvibe/Views/Components/Footer.dart';
import 'package:testconvibe/Views/Dashboard/DashboardScreen.dart';
import 'package:testconvibe/Views/HomeScreen/CardCompanies.dart';
import 'package:testconvibe/Views/Login/login.dart';

import '../../Model/Company/ConpanyResponse.dart';
import '../Components/AppBar.dart';
import '../ServerSetting/ServerSetting.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? func;
  @override
  void initState() {
    func = getListCOMPANY();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Token cleared successfully')),
    // );
  }

  Widget ItemAction() {
    return PopupMenuButton<String>(
      icon: ClipOval(
        child: Image.network(
            width: 35,
            height: 40,
            fit: BoxFit.cover,
            "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
      ),
      onSelected: (value) {
        // Gérez la sélection de l'élément du menu ici
        print('Option sélectionnée: $value');
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            onTap: () {
              _clearToken();
              Navigator.pushNamedAndRemoveUntil(
                  context, Login.routeName, (route) => false);
            },
            //value: 'Option 1',
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: _clearToken,
                  tooltip: 'Clear Token',
                  color: Colors.red,
                ),
                Text(
                  'logout',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(Title: "Companies", Action: ItemAction()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<dynamic>(
              future: func,
              builder: (
                BuildContext context,
                AsyncSnapshot<dynamic> snapshot,
              ) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  print("---------");
                  print(snapshot.data);
                  print("---------");
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "No Data  ",
                      style: TextStyle(color: Colors.grey),
                    ));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext ctx, index) {
                          Company company = snapshot.data[index];
                          return snapshot.data.length != null
                              ? InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    print("this is id ");
                                    print(company.id);
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardScreen(
                                                    company: company)),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Cardcompanies(
                                    company: snapshot.data[index],
                                  ))
                              : Center(child: Text(" "));
                        });
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
            Container(margin: EdgeInsets.only(top: 100), child: Footer())
          ],
        ),
      ),
    );
  }
}
