import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

import '../../generated/assets.dart';
import '../CompanyInfo/InfoScreen.dart';
import '../Employee/EmployeeScreen.dart';
import '../HomeScreen/Home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  int _notificationCount = 0;

  // Initialize notification count

  @override
  void initState() {
    super.initState();
    // Initialize idCitoyen asynchronously
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, Infoscreen.routeName);
        case 1:
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Employeescreen()),
              (Route<dynamic> route) => false);
          break;
        case 2:
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);

          break;
        case 3:
          break;
        case 4:
          break;
      }
    }

    // final inputTexProvider = Provider.of<inputTex>(context);
    // setState(() {
    //   _notificationCount = inputTexProvider.nbrNotif;
    // });

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.iconsBuilding01,
              height: 20, width: 20, color: Colors.black),
          label: "Company info",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.iconsUsers,
              height: 20, width: 20, color: Colors.black),
          label: "Employees",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.iconsHomeLine,
              height: 20, width: 20, color: Colors.black),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: badges.Badge(
              badgeContent: Text(
                _notificationCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
              child: SvgPicture.asset(Assets.iconsFileCheck01,
                  height: 20, width: 20, color: Colors.black)),
          label: 'Approvals',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.iconsBarChartSquareDown,
              height: 20, width: 20, color: Colors.black),
          label: "Reports",
        ),
      ],
      selectedLabelStyle: TextStyle(
          fontFamily: 'SFProMEDIUM',
          fontWeight: FontWeight.normal,
          fontSize: 10),
      unselectedLabelStyle: TextStyle(
          fontFamily: 'SFProMEDIUM',
          fontWeight: FontWeight.normal,
          fontSize: 10),
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.black,
      selectedFontSize: 12,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );
  }
}
