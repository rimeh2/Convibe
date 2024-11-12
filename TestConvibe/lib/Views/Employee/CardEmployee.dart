import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';
import '../../Model/Company/Employee.dart';

class CardEmployee extends StatelessWidget {
  final Data
      employee; // Now using Data class directly for individual employee data

  const CardEmployee({super.key, required this.employee});
  String calculateExperience(String joinDate) {
    DateTime date = DateTime.parse(joinDate); // Convert string to DateTime
    final currentDate = DateTime.now();

    int years = currentDate.year - date.year; // Use `date` (DateTime object)
    int months = currentDate.month - date.month;

    // Adjust if the month difference is negative
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return '$years Years and $months Months';
  }

  String calculateage(String joinDate) {
    DateTime date = DateTime.parse(joinDate); // Convert string to DateTime
    final currentDate = DateTime.now();

    int years = currentDate.year - date.year; // Use `date` (DateTime object)
    int months = currentDate.month - date.month;

    // Adjust if the month difference is negative
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return '$years Years ';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 90, // Adjusted height
      width: MediaQuery.of(context).size.width * 0.92, // Responsive width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.network(
                employee.image ??
                    "https://placeholder.com/50", // Default if image is null
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.02, // Responsive spacing
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${employee.firstName ?? ''} ${employee.lastName ?? ''}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: BaseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  employee.city ?? 'Location unknown',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: BaseColor,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/users.svg",
                      width: 13,
                      height: 13,
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      semanticsLabel: 'User icon',
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${employee.country ?? 'N/A'}",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/cake.svg",
                      width: 13,
                      height: 13,
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      semanticsLabel: 'User icon',
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${calculateage(employee.dateOfBirth!)}",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/calender.svg",
                      width: 13,
                      height: 13,
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      semanticsLabel: 'User icon',
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${calculateExperience(employee.joiningDate!)}",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   width: 24,
          //   height: 24,
          //   child: SvgPicture.asset(
          //     "assets/icons/star.svg", // Use a relevant icon here
          //     width: 20,
          //     color: Colors.amber, // Example for a "favorite" icon
          //   ),
          // ),
        ],
      ),
    );
  }
}
