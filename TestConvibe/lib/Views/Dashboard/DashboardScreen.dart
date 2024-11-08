import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'package:testconvibe/Views/HomeScreen/CardCompanies.dart';

import '../../Constants/colors.dart';
import '../Components/AppBar.dart';
import '../Components/CustomNavBar.dart';
import '../ServerSetting/ServerSetting.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = 'DashboardScreen';
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
      appBar: AppBarSpecial(Title: "Dashboard", Action: ItemAction()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(28),
              height: 90,
              width:
                  MediaQuery.of(context).size.width * 0.95, // Responsive width
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
                //color: Colors.redAccent,
                color: backgroundCard, // Background color
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        5), // Match Container's border radius
                    child: Image.network(
                      "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                      fit: BoxFit.fill,
                      width:
                          90, // Set the width to match the container's height for a square image
                      height: 90,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.02, // Responsive spacing
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Altech Aluminium & Street Wlll',
                          style: GoogleFonts.poppins(
                            fontSize: 16, // Responsive font size
                            color: BaseColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Doha-Qatar',
                            style: GoogleFonts.poppins(
                              fontSize: 12, // Responsive font size
                              color: BaseColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width *
                              0.7, // Responsive width
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var data in ["192", "19", "12"])
                                Expanded(
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        width: 13,
                                        height: 13,
                                        "assets/icons/users.svg",
                                        colorFilter: ColorFilter.mode(
                                            Colors.grey, BlendMode.srcIn),
                                        semanticsLabel: 'User icon',
                                      ),
                                      Text(
                                        data,
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(28),

              height: 250,
              width:
                  MediaQuery.of(context).size.width * 0.95, // Responsive width
              decoration: BoxDecoration(
                color: Color.fromRGBO(229, 229, 239, 1.0) // Fully opaque
                , // Background color
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(13, 10, 44, 0.08), // Shadow color
                    offset: Offset(0, 2), // Horizontal and vertical offset
                    blurRadius: 6, // Blur effect
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Nationality',
                            style: GoogleFonts.kodchasan(
                              textStyle: TextStyle(
                                fontSize: 22,
                                color: BaseColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/Pie.svg",
                              semanticsLabel: 'Pie',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 56, right: 5, left: 10),
                      width: MediaQuery.of(context).size.width *
                          0.4, // Adjust width as needed

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCountryRow(
                              'USA', '39.11%', Colors.blue.shade900),
                          _buildCountryRow(
                              'Canada', '28.02%', Colors.blue.shade700),
                          _buildCountryRow(
                              'U.K.', '23.13%', Colors.blue.shade300),
                          _buildCountryRow(
                              'Australia', '5.03%', Colors.blue.shade100),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget _buildCountryRow(String country, String percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              shape: BoxShape.rectangle,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              country,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color.fromRGBO(13, 10, 44, 1), // Text color
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            percentage,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Color.fromRGBO(13, 10, 44, 1),
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> _items = [
    const Text('Home'),
    const Text('Business'),
    const Text('School'),
  ];

  int cIndex = 0;
  final iconLinearGradiant = List<Color>.from([
    const Color.fromARGB(255, 251, 2, 197),
    const Color.fromARGB(255, 72, 3, 80)
  ]);
}
