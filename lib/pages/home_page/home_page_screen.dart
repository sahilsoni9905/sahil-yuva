import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_landing_page/pages/calender_page/calender_page_screen.dart';
import 'package:new_landing_page/pages/home_page/widgets/buildContainer_widget.dart';
import 'package:new_landing_page/pages/remider_page/remider_page_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  void changeScreenToCallender(BuildContext context) {
    Navigator.pushNamed(context, CalenderPageScreen.routeName);
  }

  void changeScreenToReminder(BuildContext context) {
    Navigator.pushNamed(context, RemiderPageScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM').format(now);
    String dayOfWeek = DateFormat('EEEE').format(now);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CD),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.55,
              left: screenWidth * 0.5,
              child: Image.asset(
                'assets/images/home_page_leaf4.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.38,
              ),
            ),
            Positioned(
              top: screenHeight * 0.31,
              left: screenWidth * 0.4,
              child: Image.asset(
                'assets/images/home_page_left3.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.3,
              ),
            ),
            Positioned(
              top: screenHeight * 0.55,
              left: screenWidth * 0.75,
              child: Image.asset(
                'assets/images/leaf_right_home.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.035),
                  Text(
                    'Hey There,',
                    style: GoogleFonts.josefinSans(
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: 0.9,
                      color: const Color(0xFF053901),
                    ),
                  ),
                  Text(
                    'Sahil',
                    style: GoogleFonts.josefinSans(
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF053901),
                    ),
                  ),
                  Text(
                    '$formattedDate, $dayOfWeek',
                    style: GoogleFonts.josefinSans(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF054400),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.13),
                  Row(
                    children: [
                      Text(
                        'Wellness.',
                        style: GoogleFonts.josefinSans(
                          fontSize: screenHeight * 0.038,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF053901),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.035),
                      Text(
                        'That\'s it',
                        style: GoogleFonts.josefinSans(
                          fontSize: screenHeight * 0.038,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF053901),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Expanded(
                    child: GridView.extent(
                      maxCrossAxisExtent: screenHeight * 0.36,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 13,
                      children: [
                        buildContainer(
                          context,
                          imgAddress: 'assets/images/Vector.png',
                          color: const Color(0xFFCAD0AF),
                          textColor: const Color(0xFF053901),
                          text: 'Daily \nJournal',
                          onPressed: () {},
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          buttonBackgroundColor: const Color(0xFFD7E5CA),
                          iconColor: const Color(0xFF53924E),
                        ),
                        buildContainer(
                          context,
                          imgAddress: 'assets/images/category2.png',
                          color: const Color(0xFFFBDB9D),
                          text: 'Medical \nRecords',
                          onPressed: () {},
                          textColor: const Color(0xFFB6861F),
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          buttonBackgroundColor: const Color(0xFFFFF1D0),
                          iconColor: const Color(0xFFF4C555),
                        ),
                        buildContainer(
                          context,
                          imgAddress: 'assets/images/category3.png',
                          text: 'Medicine \nCalender',
                          onPressed: () {
                            changeScreenToCallender(context);
                          },
                          textColor: const Color(0xFFA35035),
                          color: const Color(0xFFE2B9A6),
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          buttonBackgroundColor: const Color(0xFFF3D5CB),
                          iconColor: const Color(0xFFBF7466),
                        ),
                        buildContainer(
                          context,
                          imgAddress: 'assets/images/reminder_icon.png',
                          text: 'Reminders',
                          onPressed: () {
                            changeScreenToReminder(context);
                          },
                          textColor: const Color(0xFF5E3B27),
                          color: const Color(0xFFC7AA93),
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          buttonBackgroundColor: const Color(0xFFCFBDB0),
                          iconColor: const Color(0xFF8C6A56),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -screenHeight * 0.02,
              left: screenWidth * 0.5,
              child: ClipRect(
                child: Image.asset(
                  'assets/images/right_cloud_home.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.1,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.17,
              left: -screenWidth * 0.22,
              child: ClipRect(
                child: Image.asset(
                  'assets/images/right_cloud_home.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.1,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.6,
              child: ClipRect(
                child: Image.asset(
                  'assets/images/ipo1.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
