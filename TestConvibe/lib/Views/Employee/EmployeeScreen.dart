import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/Company/Employee.dart';

import '../../Constants/colors.dart';
import '../../Services/Employee.dart';
import '../../generated/assets.dart';
import '../Components/AppBar.dart';
import '../Components/CustomNavBar.dart';
import '../Login/login.dart';
import 'CardEmployee.dart';
import 'DetailsEmployee.dart';

class Employeescreen extends StatefulWidget {
  static String routeName = 'Employeescreen';

  Employeescreen({super.key});

  @override
  State<Employeescreen> createState() => _EmployeescreenState();
}

class _EmployeescreenState extends State<Employeescreen> {
  final TextEditingController searchController = TextEditingController();
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

  late Future<List<Data>> func;

  @override
  void initState() {
    func = getListEmployee(1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(
        Title: "Employees",
        Action: ItemAction(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi,Administrator',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: BaseColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextFormField2(
                    prefixIcon: IconButton(
                        icon: SvgPicture.asset(Assets.iconsSearchNormal,
                            color: grey717, semanticsLabel: 'Label'),
                        onPressed: () {}),
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    hintText: "Search employee...",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    'assets/icons/Filter.svg',
                    semanticsLabel: 'User icon',
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Data>>(
              future: func, // Make sure this returns Future<List<Employee>>
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Data>> snapshot,
              ) {
                print(snapshot.connectionState);

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Center(
                      child: Text(
                        "No Data  " + snapshot.error.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<Data> employees = snapshot.data!;

                    // Filter out any employees with null data for safer access
                    final nonNullEmployees =
                        employees.where((e) => e != null).toList();

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: nonNullEmployees.length,
                      itemBuilder: (BuildContext ctx, index) {
                        // Ensure that each employee's data list is not empty
                        if (nonNullEmployees.isNotEmpty) {
                          print(nonNullEmployees[index]);
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                DetailsProfil.routeName,
                                (route) => false,
                              );
                            },
                            child: CardEmployee(
                              employee: nonNullEmployees[
                                  index], // Access first Data element
                            ),
                          );
                        } else {
                          return const SizedBox
                              .shrink(); // Render nothing for empty data
                        }
                      },
                    );
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
