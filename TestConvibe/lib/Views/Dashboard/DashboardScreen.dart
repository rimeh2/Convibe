import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'package:testconvibe/Model/Company/dashbordCompany.dart';
import 'package:testconvibe/Services/Company.dart';
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
  late Future<DashbordCompany?>
      dashbordFuture; // Declare a Future to hold the DashbordCompany data

  @override
  void initState() {
    super.initState();
    dashbordFuture =
        getdata(); // Initialize the Future when the widget is created
  }

  Future<DashbordCompany?> getdata() async {
    return await Dashbord(
        1); // Assuming Dashbord() returns a Future<DashbordCompany>
  }

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
      body: FutureBuilder<DashbordCompany?>(
        future: dashbordFuture, // Use the Future you initialized
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle errors
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            // Handle no data
            return Center(child: Text("No data available"));
          } else {
            // Access the dashbord data here
            DashbordCompany dashbord = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(28),
                    height: 90,
                    width: MediaQuery.of(context).size.width *
                        0.95, // Responsive width
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: backgroundCard, // Background color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              5), // Match Container's border radius
                          child: Image.network(
                            dashbord.data!.logo!,
                            fit: BoxFit.fill,
                            width: 90,
                            height: 90,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // Image is loaded, show the image
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            },
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
                                dashbord.data!.companyName!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16, // Responsive font size
                                  color: BaseColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                child: Text(
                                  (dashbord.data?.companyAddress?.state ?? "") +
                                      "-" +
                                      (dashbord.data?.companyAddress?.town ??
                                          ""),
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
                                  children: [
                                    //  for (var data in ["192", "19", "12"])
                                    Expanded(
                                      child: Row(
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
                                            dashbord.data!.employeesCount![0]
                                                .totalEmployees
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
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
                                            dashbord.data!.employeesCount![0]
                                                .absenteeCount
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
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
                                            dashbord.data!.employeesCount![0]
                                                .vacationCount
                                                .toString(),
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
                    //height: 250,
                    width: MediaQuery.of(context).size.width *
                        0.95, // Responsive width
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                          229, 229, 239, 1.0), // Fully opaque background color
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(13, 10, 44, 0.08), // Shadow color
                          offset:
                              Offset(0, 2), // Horizontal and vertical offset
                          blurRadius: 6, // Blur effect
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
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
                            padding:
                                EdgeInsets.only(top: 56, right: 5, left: 10),
                            width: MediaQuery.of(context).size.width *
                                0.4, // Adjust width as needed
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i <
                                        dashbord!
                                            .data!
                                            .nationalityWiseEmployeeCount!
                                            .length;
                                    i++)
                                  _buildCountryRow(
                                      dashbord!
                                          .data!
                                          .nationalityWiseEmployeeCount![i]
                                          .country!,
                                      dashbord!
                                              .data!
                                              .nationalityWiseEmployeeCount![i]
                                              .percentage
                                              .toString() +
                                          '%',
                                      Colors.indigoAccent.withOpacity(
                                          1.0 - (i * 0.1).clamp(0.1, 1.0))),
                                // _buildCountryRow(
                                //     'Canada', '28.02%', Colors.blue.shade700),
                                // _buildCountryRow(
                                //     'U.K.', '23.13%', Colors.blue.shade300),
                                // _buildCountryRow(
                                //     'Australia', '5.03%', Colors.blue.shade100),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50, top: 0),
                            child: Text(
                              'Gender',
                              style: GoogleFonts.kodchasan(
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  color: BaseColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Image.asset('assets/images/genre.png'),
                          ),
                          Positioned(
                              top: 110,
                              left: 170,
                              child: Column(
                                children: [
                                  Text(
                                    "Total",
                                    style: GoogleFonts.kodchasan(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: BaseColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${(dashbord.data?.genderWiseEmployeeCount?[1].count ?? 0) + (dashbord.data?.genderWiseEmployeeCount?[0].count ?? 0)}",
                                    style: GoogleFonts.kodchasan(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: BaseColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 50),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(150, 45, 255, 1),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              dashbord
                                  .data!.genderWiseEmployeeCount![0].gender!,
                              style: GoogleFonts.kodchasan(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BaseColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              dashbord.data!.genderWiseEmployeeCount![0].count!
                                  .toString(),
                              style: GoogleFonts.kodchasan(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BaseColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 50),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(209, 221, 37, 1),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              dashbord
                                  .data!.genderWiseEmployeeCount![1].gender!,
                              style: GoogleFonts.kodchasan(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BaseColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              dashbord.data!.genderWiseEmployeeCount![1].count!
                                  .toString(),
                              style: GoogleFonts.kodchasan(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BaseColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
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
}
