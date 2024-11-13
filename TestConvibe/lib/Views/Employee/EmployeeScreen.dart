import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/Company/Employee.dart';
import '../../Constants/colors.dart';
import '../../Services/Employee.dart';
import '../../generated/assets.dart';
import '../Components/AppBar.dart';
import '../Components/CustomNavBar.dart';
import '../Login/login.dart';
import '../Provider/provider.dart';
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
  }

  String? imageurl;
  int? id;

  Widget ItemAction() {
    return PopupMenuButton<String>(
      icon: ClipOval(
        child: Image.network(
          width: 35,
          height: 40,
          fit: BoxFit.cover,
          "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
        ),
      ),
      onSelected: (value) {
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    inputTex inputTexProvider = Provider.of<inputTex>(context);
    imageurl = inputTexProvider.image;
    id = inputTexProvider.id;

    if (id != null) {
      func = getListEmployee(id!);
    }
  }

  bool _isFilterVisible = false;

  void _toggleFilterMenu() {
    setState(() {
      _isFilterVisible = !_isFilterVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(
        Title: "Employees",
        Action: ItemAction(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi, Administrator',
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
                Column(
                  children: [
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
                              onPressed: () {},
                            ),
                            keyboardType: TextInputType.text,
                            controller: searchController,
                            hintText: "Search employee...",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: _toggleFilterMenu,
                            child: SvgPicture.asset(
                              width: 24,
                              height: 24,
                              'assets/icons/Filter.svg',
                              semanticsLabel: 'Filter icon',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FutureBuilder<List<Data>>(
                  future: func,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Data>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Center(child: CupertinoActivityIndicator()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error: " + snapshot.error.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<Data> employees = snapshot.data!;

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: employees.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => DetailsProfil(
                                      employee: employees[index],
                                    ),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: CardEmployee(employee: employees[index]),
                            );
                          },
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          ),
          if (_isFilterVisible)
            GestureDetector(
              onTap: _toggleFilterMenu,
              child: Container(
                margin: const EdgeInsets.only(left: 120, top: 130),
                width: 250,
                height: 450,
                // color: Colors.black54,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    //margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Departments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        _buildFilterOption('Accounts'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('Estimation'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('IT'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('Design'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('Production'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('Projects'),
                        Divider(
                          color: Colors.blueAccent,
                        ),
                        _buildFilterOption('Store'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        imageCenter: imageurl,
      ),
    );
  }

  Widget _buildFilterOption(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          print('Selected Department: $text');
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
