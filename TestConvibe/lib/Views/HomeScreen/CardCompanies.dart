import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class Cardcompanies extends StatelessWidget {
  const Cardcompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 90,
      width: MediaQuery.of(context).size.width * 0.95, // Responsive width
      decoration: BoxDecoration(
        color: backgroundCard, // Background color
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
                "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
          ),
          SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.02, // Responsive spacing
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
