import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_landing_page/global_variables.dart';
import 'package:new_landing_page/models/medical_records_models.dart';
import 'package:new_landing_page/pages/medical_records_page/widgets/year_text_widget.dart';

class MedicalRecordsPageScreen extends StatefulWidget {
  const MedicalRecordsPageScreen({super.key});

  @override
  _MedicalRecordsPageScreenState createState() =>
      _MedicalRecordsPageScreenState();
}

class _MedicalRecordsPageScreenState extends State<MedicalRecordsPageScreen> {
  int _selectedIndex = 0;
  String currentMonth = DateFormat.MMMM().format(DateTime.now());
  DateTime currentDate = DateTime.now();

  // Function to generate a list of month names
  List<String> _getMonths() {
    List<String> months = [];
    DateTime date = DateTime(DateTime.now().year, 1, 1);
    for (int i = 0; i < 12; i++) {
      months.add(DateFormat.MMMM().format(date));
      date = DateTime(date.year, date.month + 1, 1);
    }
    return months;
  }

  List<String> months = [];

  void _onYearTextTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    months = _getMonths();
  }

  void _updateMonth(DateTime newDate) {
    setState(() {
      currentDate = newDate;
      currentMonth = DateFormat.MMMM().format(newDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MedicalRecordsModels> listofMedicalRecord = [];
    for (int i = 0; i < MedicalRecordList.length; i++) {
      final recordMonth =
          DateFormat.MMMM().format(MedicalRecordList[i].dateTime);
      if (recordMonth == currentMonth) {
        listofMedicalRecord.add(MedicalRecordList[i]);
      }
    }
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFE8CD),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight * 0.3,
                color: Color(0xFFFFE8CD),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFBFD6AA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: screenHeight * 0.7,
              ),
            ],
          ),
          SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/medical_records.png',
                        width: screenWidth * 0.5,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        YearTextWidget(
                          text: '2024',
                          size: screenHeight * 0.025,
                          isSelected: _selectedIndex == 0,
                          onTap: () => _onYearTextTapped(0),
                        ),
                        YearTextWidget(
                          text: '2023',
                          size: screenHeight * 0.025,
                          isSelected: _selectedIndex == 1,
                          onTap: () => _onYearTextTapped(1),
                        ),
                        YearTextWidget(
                          text: '2022',
                          size: screenHeight * 0.025,
                          isSelected: _selectedIndex == 2,
                          onTap: () => _onYearTextTapped(2),
                        ),
                        YearTextWidget(
                          text: '2021',
                          size: screenHeight * 0.025,
                          isSelected: _selectedIndex == 3,
                          onTap: () => _onYearTextTapped(3),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails details) {
                          if (details.primaryVelocity! < 0) {
                            // Swipe left to move to next month
                            if (currentDate.month < 12) {
                              _updateMonth(DateTime(
                                  currentDate.year, currentDate.month + 1, 1));
                            }
                          } else if (details.primaryVelocity! > 0) {
                            // Swipe right to move to previous month
                            if (currentDate.month > 1) {
                              _updateMonth(DateTime(
                                  currentDate.year, currentDate.month - 1, 1));
                            }
                          }
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    currentMonth,
                                    style: GoogleFonts.josefinSans(
                                        color: Color(0xFF41733D),
                                        fontSize: screenHeight * 0.04,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              listofMedicalRecord.length == 0
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.2,
                                        ),
                                        Align(
                                          // why the text not appearing to the center
                                          alignment: Alignment.center,
                                          child: Text(
                                            'No Records Found',
                                            style: GoogleFonts.josefinSans(
                                                color: Color.fromARGB(
                                                    255, 43, 89, 39),
                                                fontSize: screenHeight * 0.04,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.2,
                                        )
                                      ],
                                    )
                                  : SizedBox(
                                      height: 10,
                                    ),
                              // i want this padding swipe thing at the bottom center
                              GestureDetector(
                                onHorizontalDragEnd: (DragEndDetails details) {
                                  if (details.primaryVelocity! < 0) {
                                    // Swipe left to move to next month
                                    if (currentDate.month < 12) {
                                      _updateMonth(DateTime(currentDate.year,
                                          currentDate.month + 1, 1));
                                    }
                                  } else if (details.primaryVelocity! > 0) {
                                    // Swipe right to move to previous month
                                    if (currentDate.month > 1) {
                                      _updateMonth(DateTime(currentDate.year,
                                          currentDate.month - 1, 1));
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/one.png',
                                        height: screenHeight * 0.025,
                                      ),
                                      Image.asset('assets/images/two.png',
                                          height: screenHeight * 0.034),
                                      Text(
                                        '  swipe  ',
                                        style: GoogleFonts.josefinSans(
                                          color: Color(0xFF053901),
                                          fontSize: screenHeight * 0.025,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Image.asset('assets/images/three.png',
                                          height: screenHeight * 0.025),
                                      Image.asset('assets/images/four.png',
                                          height: screenHeight * 0.034),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: -1 * screenWidth * 0.2,
                  child: Image.asset(
                    "assets/images/journal_page_cloud.png",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.07,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.1,
                  left: screenWidth * 0.6,
                  child: Image.asset(
                    "assets/images/journal_page_cloud.png",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.07,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
