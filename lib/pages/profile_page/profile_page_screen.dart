import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CD),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -screenHeight * 0.02,
                right: screenWidth * 0.58,
                child: Image.asset(
                  'assets/images/left_leaf_1.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.15,
                ),
              ),
              Positioned(
                top: screenHeight * 0.06,
                right: screenWidth * 0.5,
                child: Image.asset(
                  'assets/images/left_leaf_2.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.18,
                ),
              ),
              Positioned(
                top: -screenHeight * 0.02,
                left: screenWidth * 0.58,
                child: Image.asset(
                  'assets/images/right_leaf_1.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.15,
                ),
              ),
              Positioned(
                top: screenHeight * 0.06,
                left: screenWidth * 0.5,
                child: Image.asset(
                  'assets/images/right_leaf_2.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/profile_text.png',
                      width: screenWidth * 0.6,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF41733D),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    height: screenHeight * 0.56,
                    width: screenWidth * 0.8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.8 * 0.12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.52 * 0.23,
                          ),
                          Text(
                            'Virat Kohli',
                            style: GoogleFonts.josefinSans(
                                color: const Color(0xFFFFE8CD),
                                fontSize: screenHeight * 0.52 * 0.08),
                          ),
                          SizedBox(
                            height: screenHeight * 0.52 * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '175',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFFFFE8CD),
                                        fontSize: screenHeight * 0.52 * 0.08,
                                        height: screenHeight * 0.52 * 0.002),
                                  ),
                                  Text(
                                    'Height',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF92B78F),
                                        fontSize: screenHeight * 0.52 * 0.03),
                                  )
                                ],
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.16,
                                    fontWeight: FontWeight.w200),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '55',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFFFFE8CD),
                                        fontSize: screenHeight * 0.52 * 0.08,
                                        height: screenHeight * 0.52 * 0.002),
                                  ),
                                  Text(
                                    'Weight',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF92B78F),
                                        fontSize: screenHeight * 0.52 * 0.03),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'B+',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFFFFE8CD),
                                        fontSize: screenHeight * 0.52 * 0.08,
                                        height: screenHeight * 0.52 * 0.002),
                                  ),
                                  Text(
                                    'Blood Type',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF92B78F),
                                        fontSize: screenHeight * 0.52 * 0.03),
                                  )
                                ],
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.16,
                                    fontWeight: FontWeight.w200),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '17',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFFFFE8CD),
                                        fontSize: screenHeight * 0.52 * 0.08,
                                        height: screenHeight * 0.52 * 0.002),
                                  ),
                                  Text(
                                    'Years old',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF92B78F),
                                        fontSize: screenHeight * 0.52 * 0.03),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            child: Container(
                              height: screenHeight * 0.52 * 0.08,
                              width: screenWidth * 0.8 * 0.33,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 0.8,
                                  color: Color(0xFF92B78F),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in',
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF053901),
                                        fontSize:
                                            screenHeight * 0.52 * 0.08 * 0.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'To save your',
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.036),
                              ),
                              Text(
                                'Medical Records',
                                style: GoogleFonts.josefinSans(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.52 * 0.036,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                left: screenWidth * 0.3,
                top: screenHeight * 0.15,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF92B78F),
                      width: screenHeight * 0.004,
                    ),
                  ),
                  child: Container(
                    width: screenHeight * 0.14,
                    height: screenHeight * 0.14,
                    decoration: BoxDecoration(
                      color: Color(0xFF92B78F),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/profile_page_dp.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
