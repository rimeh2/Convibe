import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class CardEmployee extends StatelessWidget {
  const CardEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 70,
      // width: 389,
      width: MediaQuery.of(context).size.width * 0.92, // Responsive width
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.network(
                  width: 50,
                  "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'herry blair',
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
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 24.44,
                      height: 24,
                      child: Image.network(
                          width: 20,
                          "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Responsive width
                  child: Row(
                    children: [
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
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "029",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              "30 Years",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              "08 Years 2 Months",
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
