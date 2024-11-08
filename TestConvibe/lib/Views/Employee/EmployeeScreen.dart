import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';
import '../../generated/assets.dart';
import '../Components/AppBar.dart';
import '../Components/CustomNavBar.dart';
import 'CardEmployee.dart';

class Employeescreen extends StatelessWidget {
  static String routeName = 'Employeescreen';

  Employeescreen({super.key});
  final TextEditingController searchController = TextEditingController();

  Widget ItemAction() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: ClipOval(
        child: Image.network(
            width: 40,
            height: 40,
            "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(
        Title: "Employees",
        Action: ItemAction(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi,Administrator',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: BaseColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextFormField2(
                    prefixIcon: IconButton(
                        icon: SvgPicture.asset(Assets.iconsSearchNormal,
                            color: grey717, semanticsLabel: 'Label'),
                        onPressed: () {}),
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    hintText: "Search employee...",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    'assets/icons/Filter.svg',
                    semanticsLabel: 'User icon',
                  ),
                ),
              ],
            ),
            InkWell(child: CardEmployee())
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
