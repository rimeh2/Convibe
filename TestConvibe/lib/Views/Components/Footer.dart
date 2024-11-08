import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'All Right Reserved',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: BaseColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
