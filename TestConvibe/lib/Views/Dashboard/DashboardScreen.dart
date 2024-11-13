import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testconvibe/Model/Company/dashbordCompany.dart';
import 'package:testconvibe/Services/Company.dart';

import '../../Constants/colors.dart';
import '../../Model/Company/ConpanyResponse.dart';
import '../Components/AppBar.dart';
import '../Components/CustomNavBar.dart';
import '../Provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = 'DashboardScreen';
  final Company company;

  const DashboardScreen({super.key, required this.company});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late inputTex inputTexProvider;
  late Future<Data?> dashbordFuture;

  @override
  void initState() {
    super.initState();
    dashbordFuture = getdata();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    inputTexProvider = Provider.of<inputTex>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.company.id != null && widget.company.logo != null) {
        inputTexProvider.setid(widget.company.id!);
        inputTexProvider.setimage(widget.company.logo!);
      }
    });
  }

  Future<Data?> getdata() => Dashbordd(widget.company.id!);

  Widget _buildProfileImage() => Container(
        margin: const EdgeInsets.only(right: 20),
        child: ClipOval(
          child: Image.network(
            width: 40,
            height: 40,
            "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
          ),
        ),
      );

  Widget _buildCompanyLogo(String logoUrl) => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          logoUrl,
          fit: BoxFit.fill,
          width: 90,
          height: 90,
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
      );

  Widget _buildStatItem(int count) => Expanded(
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/users.svg",
              width: 13,
              height: 13,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      );

  Widget _buildCompanyInfo(Data dashbord) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dashbord.companyName!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: BaseColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${dashbord.companyAddress?.state ?? ""}-${dashbord.companyAddress?.town ?? ""}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: BaseColor,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                children: [
                  _buildStatItem(dashbord.employeesCount!.totalEmployees!),
                  _buildStatItem(dashbord.employeesCount!.absenteeCount!),
                  _buildStatItem(dashbord.employeesCount!.vacationCount!),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCompanyCard(Data dashbord) => Container(
        margin: const EdgeInsets.all(28),
        height: 90,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          color: backgroundCard,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            _buildCompanyLogo(dashbord.logo!),
            const SizedBox(width: 8),
            _buildCompanyInfo(dashbord),
          ],
        ),
      );

  Widget _buildNationalitySection(Data dashbord) => Container(
        margin: const EdgeInsets.all(28),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(229, 229, 239, 1.0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(13, 10, 44, 0.08),
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nationality',
                      style: GoogleFonts.kodchasan(
                        fontSize: 22,
                        color: BaseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/Pie.svg",
                    semanticsLabel: 'Pie',
                  ),
                ],
              ),
              _buildNationalityList(dashbord),
            ],
          ),
        ),
      );

  Widget _buildNationalityList(Data dashbord) => Container(
        padding: const EdgeInsets.only(top: 56, right: 5, left: 10),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0;
                i < dashbord.nationalityWiseEmployeeCount!.length;
                i++)
              _buildCountryRow(
                dashbord.nationalityWiseEmployeeCount![i].country!,
                '${dashbord.nationalityWiseEmployeeCount![i].percentage}%',
                Colors.indigoAccent
                    .withOpacity(1.0 - (i * 0.1).clamp(0.1, 1.0)),
              ),
          ],
        ),
      );

  Widget _buildCountryRow(String country, String percentage, Color color) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                country,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color.fromRGBO(13, 10, 44, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              percentage,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color.fromRGBO(13, 10, 44, 1),
              ),
            ),
          ],
        ),
      );

  Widget _buildGenderSection(Data dashbord) => Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  'Gender',
                  style: GoogleFonts.kodchasan(
                    fontSize: 22,
                    color: BaseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Image.asset('assets/images/genre.png'),
              ),
              Positioned(
                top: 110,
                left: 170,
                child: Column(
                  children: [
                    Text(
                      "Total",
                      style: GoogleFonts.kodchasan(
                        fontSize: 16,
                        color: BaseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _calculateTotalGender(dashbord).toString(),
                      style: GoogleFonts.kodchasan(
                        fontSize: 16,
                        color: BaseColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildGenderStats(dashbord),
        ],
      );

  int _calculateTotalGender(Data dashbord) {
    if (dashbord.genderWiseEmployeeCount == null ||
        dashbord.genderWiseEmployeeCount!.isEmpty) {
      return 0;
    }
    return (dashbord.genderWiseEmployeeCount?[1].count ?? 0) +
        (dashbord.genderWiseEmployeeCount?[0].count ?? 0);
  }

  Widget _buildGenderStats(Data dashbord) => Container(
        margin: const EdgeInsets.only(right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildGenderItem(
              const Color.fromRGBO(150, 45, 255, 1),
              dashbord.genderWiseEmployeeCount?.isNotEmpty == true
                  ? dashbord.genderWiseEmployeeCount![0].gender ?? "Unknown"
                  : "No Data",
              (dashbord.genderWiseEmployeeCount?.isNotEmpty == true
                      ? dashbord.genderWiseEmployeeCount![0].count
                      : 0) ??
                  0,
            ),
            _buildGenderItem(
              const Color.fromRGBO(209, 221, 37, 1),
              (dashbord.genderWiseEmployeeCount?.length ?? 0) > 1
                  ? dashbord.genderWiseEmployeeCount![1].gender ?? 'N/A'
                  : 'N/A',
              (dashbord.genderWiseEmployeeCount?.length ?? 0) > 1
                  ? dashbord.genderWiseEmployeeCount![1].count ?? 0
                  : 0,
            ),
          ],
        ),
      );

  Widget _buildGenderItem(Color color, String gender, int count) => Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
              shape: BoxShape.rectangle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            gender,
            style: GoogleFonts.kodchasan(
              fontSize: 16,
              color: BaseColor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            count.toString(),
            style: GoogleFonts.kodchasan(
              fontSize: 16,
              color: BaseColor,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSpecial(Title: "Dashboard", Action: _buildProfileImage()),
      body: FutureBuilder<Data?>(
        future: dashbordFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          final dashbord = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildCompanyCard(dashbord),
                _buildNationalitySection(dashbord),
                _buildGenderSection(dashbord),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavBar(
        imageCenter: widget.company.logo,
      ),
    );
  }
}
