import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testconvibe/Model/Company/ConpanyResponse.dart';

import '../../Constants/colors.dart';

class Cardcompanies extends StatelessWidget {
  final Company company;
  const Cardcompanies({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 18),
      height: 90,
      width: MediaQuery.of(context).size.width * 0.95, // Responsive width
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundCard, // Background color
              borderRadius: BorderRadius.circular(50),
            ),
            width: 80,
            height: 80,
            child: ClipOval(
              child: Image.network(company.logo!),
            ),
          ),
          SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.03, // Responsive spacing
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    company.companyName!,
                    style: GoogleFonts.poppins(
                      fontSize: 16, // Responsive font size
                      color: BaseColor,
                      fontWeight: FontWeight.bold,
                    ),
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
                  height: 15,
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
    );
  }
}
