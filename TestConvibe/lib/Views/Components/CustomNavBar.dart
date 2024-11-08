import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testconvibe/Views/Employee/EmployeeScreen.dart';

import '../../generated/assets.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  // Track the active state for each icon
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Assets.iconsUsers, 0),
          _buildNavItem(Assets.iconsCurrencyDollarCircle, 1),
          _buildCenterItem(),
          _buildNavItem(Assets.iconsFileCheck01, 2),
          _buildNavItem(Assets.iconsBarChartSquareDown, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = _selectedIndex == index ? -1 : index;
        });
        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
                context, Employeescreen.routeName, (route) => false);
            break;
          case 1:
            print("1");
            break;
          case 2:
            print("2");
            break;
          case 3:
            print("3");
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              _selectedIndex == index ? Colors.purple : Colors.grey,
              BlendMode.srcIn,
            ),
            semanticsLabel: 'Icon $index',
          ),
          if (_selectedIndex == index)
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCenterItem() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: Image.network(
          "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp", // Replace with your icon URL
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
