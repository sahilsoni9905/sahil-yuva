import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalRecordLandingPage extends StatelessWidget {
  const MedicalRecordLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFE8CD),
      body: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Keep',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text(
                  'Track',
                  style: GoogleFonts.josefinSans(
                    color: Color(0xFF053901),
                    fontSize: screenHeight * 0.06,
                    fontWeight: FontWeight.w400,
                    height: screenHeight * 0.0012,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'of',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text(
                  'your',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text(
                  'Records',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w400,
                      height: screenHeight * 0.0012),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'by',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text(
                  'answering',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'few',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w300,
                      height: screenHeight * 0.0012),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text(
                  'Questions',
                  style: GoogleFonts.josefinSans(
                      color: Color(0xFF053901),
                      fontSize: screenHeight * 0.06,
                      fontWeight: FontWeight.w400,
                      height: screenHeight * 0.0012),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Wellness. That\'s it',
                style: GoogleFonts.josefinSans(
                  color: Color(0xFF053901),
                  fontSize: screenHeight * 0.03,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
