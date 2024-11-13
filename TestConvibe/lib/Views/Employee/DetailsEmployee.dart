import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:testconvibe/Views/Components/RightBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Model/Company/Employee.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../Constants/colors.dart';
import 'CardProfil.dart';
import 'EmployeeScreen.dart';

class DetailsProfil extends StatefulWidget {
  static String routeName = 'DetailsProfil';
  final Data employee;
  const DetailsProfil({super.key, required this.employee});

  @override
  State<DetailsProfil> createState() => _DetailsProfilState();
}

class _DetailsProfilState extends State<DetailsProfil> {
  late ScrollController _scrollController;
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

  String calculateAge(String joinDate) {
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
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient (Fixed)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(135, 186, 55, 0.0).withOpacity(0.15),
                  Color.fromRGBO(133, 132, 255, 0.32),
                  Color.fromRGBO(255, 73, 248, 0.15),
                ],
                stops: [0.2, 0.5, 0.8],
                transform: GradientRotation(148 * 3.1416 / 180),
              ),
            ),
          ),

          // SliverAppBar with Employee Image (Fixed)
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 350,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Employeescreen()),
                        (Route<dynamic> route) => false);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Go Back.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/Notifications.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Image.network(
                      widget.employee.image!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Independently Scrollable Content in SliverToBoxAdapter
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set a height to allow inner scrolling
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        CardProfil(
                          titre: "PROFESSIONAL",
                          informationText1: widget.employee.joiningDate,
                          informationText2: "Joining Date",
                          informationText3: "00-00-00",
                          informationText4: "Contact Expiry",
                          informationText5: "Work Visa",
                          informationText6: "Visa Type",
                          informationText7: "Mech.Engineer",
                          informationText8: "Profession",
                          informationText9: widget.employee.id.toString(),
                          informationText10: "Qatar ID",
                          informationText11: widget.employee.arrivalDate,
                          informationText12: "ID Expiry",
                        ),
                        SizedBox(height: 20),
                        CardProfil(
                          titre: "PERSONAL",
                          informationText1:
                              widget.employee.gender == 1 ? "Male" : "Female",
                          informationText2: "Gender",
                          informationText3:
                              widget.employee.maritalStatus.toString(),
                          informationText4: "Marital Status",
                          informationText5: widget.employee.religion.toString(),
                          informationText6: "Religion",
                          informationText7: widget.employee.bloodGrp.toString(),
                          informationText8: "Blood Group",
                          informationText9: widget.employee.id.toString(),
                          informationText10: "Qualification",
                          informationText11: "India",
                          informationText12: "Nationality",
                        ),
                        SizedBox(height: 20),
                        CardProfil(
                          titre: "CONTACT    ",
                          informationText1: widget.employee.mobileNumber,
                          informationText2: "Phone (Office)",
                          informationText3: widget.employee.mobileNumber,
                          informationText4: "Phone (Personal)",
                          informationText5: widget.employee.emergencyContact,
                          informationText6: "Emergency Contact",
                          informationText7: widget.employee.email,
                          informationText8: "E-mail (Office)",
                          informationText9: widget.employee.email.toString(),
                          informationText10: "E-mail",
                        ),
                        SizedBox(height: 20),
                        CardProfil(
                          titre: "ADDRESS",
                          informationText1: widget.employee.permanentAddress,
                          informationText2: "Permanent",
                          informationText5: widget.employee.localAddress,
                          informationText6: "Local",
                        ),
                        SizedBox(height: 20),
                        CardProfil(
                          titre: "ACCOMMODATION",
                          informationText1:
                              widget.employee.employeeType.toString(),
                          informationText2: "Type",
                          informationText3: "FM-01",
                          informationText4: "Reference",
                          informationText5: widget.employee.permanentAddress,
                          informationText6: "Location",
                          informationText7: widget.employee.localAddress,
                          informationText8: "Address",
                          informationText9: widget.employee.arrivalDate,
                          informationText10: "Occupied",
                          informationText11:
                              widget.employee.joiningDate.toString(),
                          informationText12: "Expiry",
                        ),
                        SizedBox(height: 500),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Positioned Employee Info Box (Fixed)
          Positioned(
            top: 350,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.employee.firstName ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "  ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.employee.lastName ?? "",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Whatsapp.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    call();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/Call.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(
                                  "assets/icons/Flag.svg",
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.employee.city!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconText("assets/icons/users.svg", "029"),
                            _buildIconText("assets/icons/cake.svg",
                                "${calculateAge(widget.employee.dateOfBirth!)}"),
                            _buildIconText("assets/icons/calender.svg",
                                "${calculateExperience(widget.employee.joiningDate!)}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating button (Fixed position)
          Positioned(
            bottom: 100,
            right: 10,
            child: Rightbar(),
          ),
        ],
      ),
    );
  }

  // @override
  Widget _buildIconText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 13,
          height: 13,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Future<void> call() async {
    try {
      final Uri url = Uri(scheme: 'tel', path: widget.employee.mobileNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print("Cannot launch URL");
      }
    } catch (e) {
      print("Error launching URL: $e");
    }
  }

  @override
  void initState() {
    _scrollController = new ScrollController();

    // TODO: implement initState
    super.initState();
  }
}
