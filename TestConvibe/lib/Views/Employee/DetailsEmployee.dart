import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:testconvibe/Views/Components/RightBar.dart';

import '../../Constants/colors.dart';
import 'CardProfil.dart';
import 'EmployeeScreen.dart';

class DetailsProfil extends StatefulWidget {
  static String routeName = 'DetailsProfil';

  const DetailsProfil({super.key});

  @override
  State<DetailsProfil> createState() => _DetailsProfilState();
}

class _DetailsProfilState extends State<DetailsProfil> {
  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  2, // Extended height for scrolling
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(135, 186, 55, 0.0).withOpacity(0.15),
                    Color.fromRGBO(133, 132, 255, 0.32),
                    Color.fromRGBO(255, 73, 248, 0.15),
                  ],
                  stops: [0.2, 0.5, 0.8],
                  transform: GradientRotation(
                      148 * 3.1416 / 180), // Rotation in radians
                ),
              ),
            ),
          ),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Employeescreen.routeName, (route) => false);
                    // Button action here
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Go Back.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
                //  backgroundColor: Colors.grey[200],
                //  backgroundColor: Colors.grey[200],
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      // Button action here
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/Notifications.svg',
                      height: 24,
                      width: 24,
                    ),
                  )
                ],
                expandedHeight: 350,
                centerTitle: true,
                //  title: Text("hello"),
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0)),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                            ),
                            // <-- BACKGROUND IMAGE
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    CardProfil(),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 350,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              height: 90,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Herry Blair',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: BaseColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Whatsapp.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(
                                  "assets/icons/Call.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(
                                  "assets/icons/Flag.svg",
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Doha, Qatar',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: BaseColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconText("assets/icons/users.svg", "029"),
                            _buildIconText(
                                "assets/icons/users.svg", "30 Years"),
                            _buildIconText(
                                "assets/icons/users.svg", "08 Years 2 Months"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(bottom: 100, right: 10, child: Rightbar())
        ],
      ),
    );
  }

  // @override
  Widget _buildIconText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 13,
          height: 13,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  @override
  void initState() {
    _scrollController = new ScrollController();

    // TODO: implement initState
    super.initState();
  }
}
