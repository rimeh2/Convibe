import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colors.dart';

class CardProfil extends StatelessWidget {
  const CardProfil(
      {super.key,
      this.informationText1,
      this.informationText2,
      this.informationText3,
      this.informationText4,
      this.informationText5,
      this.informationText6,
      this.informationText7,
      this.informationText8,
      this.informationText9,
      this.informationText10,
      this.informationText11,
      this.informationText12,
      this.titre});
  final String? informationText1;
  final String? informationText2;
  final String? informationText3;
  final String? informationText4;
  final String? informationText5;
  final String? informationText6;
  final String? informationText7;
  final String? informationText8;
  final String? informationText9;
  final String? informationText10;
  final String? informationText11;
  final String? informationText12;
  final String? titre;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 38.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25),

              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centrer la colonne verticalement
                children: [
                  for (var char in titre!.split('')) // Séparer chaque lettre
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        char,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          letterSpacing: 4.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: colorcart,
              ),
              // height: 250,
              width: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8), // Add padding around the column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText1 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText2 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText3 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText4 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText5 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText6 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText7 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText8 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText9 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText10 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  informationText11 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 10, 44, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  informationText12 ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: grey717,
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
            ),
          ],
        ),
      ),
    );
  }
}
