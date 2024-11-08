import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class AppBarSpecial extends StatelessWidget implements PreferredSizeWidget {
  final Widget Action;
  final String Title;
  const AppBarSpecial({super.key, required this.Action, required this.Title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[Action],
      //  leading: Ink.image(image: "assets/icons/icon_luncher.png"),
      title: Row(
        children: [
          Image.asset(
            "assets/icons/icon_luncher.png",
            fit: BoxFit.contain,
            height: 38,
            width: 34,
          ),
          Container(
            margin: EdgeInsets.all(9),
            child: Text(
              Title,
              style: GoogleFonts.kodchasan(
                textStyle: TextStyle(
                  fontSize: 24,
                  color: BaseColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
