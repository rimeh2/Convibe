import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:testconvibe/Views/Employee/EmployeeScreen.dart';

import '../../generated/assets.dart';

class Rightbar extends StatefulWidget {
  @override
  _RightbarState createState() => _RightbarState();
}

class _RightbarState extends State<Rightbar> {
  // Track the active state for each icon
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Assets.iconsGrid01, 0),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsBankNote03, 1),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsCoinsHand, 2),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsBox, 3),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsCalendarCheck01, 4),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsPackage, 6),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsGrid01, 0),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsBankNote03, 1),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsCoinsHand, 2),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsBox, 3),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsCalendarCheck01, 4),
            SizedBox(height: 15),
            _buildNavItem(Assets.iconsPackage, 6),
          ],
        ),
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
            print("0");
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
}
