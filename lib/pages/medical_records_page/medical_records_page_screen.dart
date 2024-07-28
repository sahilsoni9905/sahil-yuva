import 'package:flutter/material.dart';
import 'package:new_landing_page/pages/medical_records_page/widgets/year_text_widget.dart';

class MedicalRecordsPageScreen extends StatefulWidget {
  const MedicalRecordsPageScreen({super.key});

  @override
  _MedicalRecordsPageScreenState createState() =>
      _MedicalRecordsPageScreenState();
}

class _MedicalRecordsPageScreenState extends State<MedicalRecordsPageScreen> {
  int _selectedIndex = -1;

  void _onYearTextTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/medical_records.png',
                    width: screenWidth * 0.5,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    YearTextWidget(
                      text: 'ALL RECORDS',
                      size: screenHeight * 0.02,
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onYearTextTapped(0),
                    ),
                    YearTextWidget(
                      text: '2024',
                      size: screenHeight * 0.02,
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onYearTextTapped(1),
                    ),
                    YearTextWidget(
                      text: '2023',
                      size: screenHeight * 0.02,
                      isSelected: _selectedIndex == 2,
                      onTap: () => _onYearTextTapped(2),
                    ),
                    YearTextWidget(
                      text: '2022',
                      size: screenHeight * 0.02,
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onYearTextTapped(3),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
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
