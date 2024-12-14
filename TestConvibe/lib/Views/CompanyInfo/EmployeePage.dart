import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testconvibe/Model/Company/dashbordCompany.dart';

import '../../Services/Company.dart';
import '../../generated/assets.dart';
import '../Components/BottomNavBar.dart';
import '../Employee/EmployeeScreen.dart';
import '../Provider/provider.dart';

class EmployeePage extends StatefulWidget {
  static const String routeName = 'EmployeePage';

  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  late Future<Data?> func;
  int? id;
  final Map<String, String> filterTitleList = {
    'Employees': "0",
    'Absentees': "1",
    'Off-duty': "2",
    'Rebewals': "3",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Employeescreen()),
                (Route<dynamic> route) => false);
          },
          icon: SvgPicture.asset(
            color: Color.fromRGBO(140, 142, 152, 1),
            'assets/icons/Go Back.svg',
            height: 24,
            width: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              color: Color.fromRGBO(140, 142, 152, 1),
              'assets/icons/Notifications.svg',
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Data?>(
        future: func,
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
                Center(child: _buildCompanyLogo(dashbord.logo!)),
                _buildCompanyInfo(dashbord),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                        height: 70,
                        width: 115,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                action('tel', dashbord.companyPhone);
                              },
                              child: SvgPicture.asset(
                                "assets/icons/Call.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text("Call")
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                        height: 70,
                        width: 115,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                action('sms', dashbord.companyPhone);
                              },
                              child: SvgPicture.asset(
                                "assets/icons/Whatsapp.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text("Whatsapp")
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                        height: 70,
                        width: 115,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                sendEmail(dashbord.companyMail);
                              },
                              child: SvgPicture.asset(
                                Assets.iconsMail01,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Text("E-mail")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 37,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(' Employees',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SFProRegular',
                          ))),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildCompanyInfo(Data dashbord) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dashbord.companyName!,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SFProRegular',
              ),
            ),
          ),
          Text(
            "${dashbord.companyAddress?.state ?? ""}-${dashbord.companyAddress?.town ?? ""}",
            style: TextStyle(
                fontFamily: 'SFProRegular',
                color: Colors.grey[500],
                fontSize: 12),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              children: [
                _buildStatItem(dashbord.employeesCount!.totalEmployees!,
                    Assets.iconsUsers),
                _buildStatItem(dashbord.employeesCount!.absenteeCount!,
                    Assets.iconsUseryes),
                _buildStatItem(dashbord.employeesCount!.vacationCount!,
                    Assets.iconsUsersX),
              ],
            ),
          ),
        ],
      );
  Widget _buildStatItem(int count, String icon) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      );

  Widget _buildCompanyLogo(String logoUrl) => ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.network(
          logoUrl,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    inputTex inputTexProvider = Provider.of<inputTex>(context);

    id = inputTexProvider.id;
    print("get id ");
    print(id);
    if (id != null) {
      func = Dashbordd(id!);
    }
  }

  Future<void> action(type, to) async {
    try {
      // Construct the SMS URL
      final Uri url = Uri(scheme: type, path: to);

      // Check if the URL can be launched
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print("Cannot launch SMS URL");
      }
    } catch (e) {
      print("Error launching SMS URL: $e");
    }
  }

  Future<void> sendEmail(String? email) async {
    if (email == null || email.isEmpty) {
      print("Error: Email address is null or empty.");
      return;
    }

    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Hello from Convibe !',
          'body': 'I wanted to reach out to you about...'
        }),
      );

      print("Encoded URI: $emailUri");

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        print("No email app found to send the email.");
      }
    } catch (e) {
      print("Error launching email URL: $e");
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
