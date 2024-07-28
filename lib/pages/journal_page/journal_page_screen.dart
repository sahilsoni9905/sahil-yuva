import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_landing_page/pages/journal_page/widgets/pain_rating_widget.dart';

class JournalPageScreen extends StatefulWidget {
  const JournalPageScreen({super.key});

  @override
  State<JournalPageScreen> createState() => _JournalPageScreenState();
}

class _JournalPageScreenState extends State<JournalPageScreen> {
  int _selectedButton = -1;
  final TextEditingController _painLocationController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();

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
                top: -1 * screenHeight * 0.038,
                left: -1 * screenWidth * 0.1,
                child: Image.asset(
                  'assets/images/journal_page_sum.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.18,
                ),
              ),
              Positioned(
                top: screenHeight * 0.045,
                left: screenWidth * 0.45,
                child: Image.asset(
                  'assets/images/journal_page_cloud.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.11,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Journal.png',
                      width: screenWidth * 0.45,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41733D),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.9,
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.045),
                            child: Text(
                              'Rate your pain',
                              style: GoogleFonts.josefinSans(
                                color: Color(0xFFFFE8CD),
                                fontSize: screenHeight * 0.036,
                              ),
                            ),
                          ),
                        ),
                        PainRatingWidget(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.9,
                          onRatingSelected: (rating) {
                            setState(() {
                              _selectedButton = rating;
                            });
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBFD6AA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: screenHeight * 0.21,
                          width: screenWidth * 0.9,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Color(0xFF41733D),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                height: screenHeight * 0.0798,
                                width: screenWidth * 0.9,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.045),
                                  child: Text(
                                    'Where are you experiencing \npain',
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFFFFE8CD),
                                      fontSize: screenHeight * 0.027,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.045,
                                    vertical: screenHeight * 0.0115),
                                child: TextField(
                                  controller: _painLocationController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'Enter the pain location...',
                                    hintStyle: GoogleFonts.josefinSans(
                                      color: Colors.black54,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.black87,
                                    fontSize: screenHeight * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        // symptoms
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBFD6AA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: screenHeight * 0.16,
                          width: screenWidth * 0.9,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Color(0xFF41733D),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                height: screenHeight * 0.048,
                                width: screenWidth * 0.9,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.045),
                                  child: Text(
                                    'Any Symptoms?',
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFFFFE8CD),
                                      fontSize: screenHeight * 0.027,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.045,
                                    vertical: screenHeight * 0.008),
                                child: TextField(
                                  controller: _symptomsController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'Enter symptoms...',
                                    hintStyle: GoogleFonts.josefinSans(
                                      color: Colors.black54,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.black87,
                                    fontSize: screenHeight * 0.0162,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
