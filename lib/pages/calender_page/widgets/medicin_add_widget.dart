import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import the intl package

class AddMedicineDialog extends StatefulWidget {
  @override
  _AddMedicineDialogState createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  int _selectedButton = -1; 
  int _selectedImageIndex = -1; 

  @override
  void dispose() {
    _medicineController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    _diagnosisController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        // Format to Month Day
        controller.text =
            DateFormat('MMM d').format(pickedDate).substring(0, 6);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        backgroundColor: const Color(0xFFBFD6AA),
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight * 0.7 * 0.18,
                    decoration: BoxDecoration(
                      color: Color(0xFF053901),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.8 * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Time to Chart 📈',
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.7 * 0.035),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.8 * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '----> Health to Wellness',
                                style: GoogleFonts.josefinSans(
                                    color: Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.7 * 0.035),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenHeight * 0.7 * 0.04),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.7 * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Which Medication are you ',
                                  style: GoogleFonts.josefinSans(
                                      fontSize: screenHeight * 0.7 * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF042D00),
                                      height: screenHeight * 0.7 * 0.002),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'on?',
                                  style: GoogleFonts.josefinSans(
                                      fontSize: screenHeight * 0.7 * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF042D00),
                                      height: screenHeight * 0.7 * 0.002),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: TextField(
                                    controller: _medicineController,
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFF042D00),
                                      fontSize: screenHeight * 0.7 * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  'From:',
                                  style: GoogleFonts.josefinSans(
                                      fontSize: screenHeight * 0.7 * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF042D00),
                                      height: screenHeight * 0.7 * 0.002),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: TextField(
                                    controller: _fromDateController,
                                    readOnly: true,
                                    onTap: () => _selectDate(
                                        context, _fromDateController),
                                    decoration: InputDecoration(
                                      hintText: 'Select start date',
                                      hintStyle: GoogleFonts.josefinSans(
                                        color:
                                            Color(0xFF042D00).withOpacity(0.5),
                                        fontSize: screenHeight * 0.7 * 0.03,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFF042D00),
                                      fontSize: screenHeight * 0.7 * 0.03,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'To:',
                                  style: GoogleFonts.josefinSans(
                                      fontSize: screenHeight * 0.7 * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF042D00),
                                      height: screenHeight * 0.7 * 0.002),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: TextField(
                                    controller: _toDateController,
                                    readOnly: true,
                                    onTap: () =>
                                        _selectDate(context, _toDateController),
                                    decoration: InputDecoration(
                                      hintText: 'Select end date',
                                      hintStyle: GoogleFonts.josefinSans(
                                        color:
                                            Color(0xFF042D00).withOpacity(0.5),
                                        fontSize: screenHeight * 0.7 * 0.03,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFF042D00),
                                      fontSize: screenHeight * 0.7 * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.7 * 0.03,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Diagnosis:',
                                  style: GoogleFonts.josefinSans(
                                      fontSize: screenHeight * 0.7 * 0.03,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF042D00),
                                      height: screenHeight * 0.001),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _diagnosisController,
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF053901),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.josefinSans(
                                      color: Color(0xFF042D00),
                                      fontSize: screenHeight * 0.7 * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.7 * 0.05,
                            ),
                            Text(
                              'How many times a day?',
                              style: GoogleFonts.josefinSans(
                                  fontSize: screenHeight * 0.7 * 0.03,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF042D00),
                                  height: screenHeight * 0.001),
                            ),
                            SizedBox(
                              height: screenHeight * 0.7 * 0.02,
                            ),
                            Container(
                              height: screenHeight * 0.7 * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF053901), // Border color
                                  width: 2.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(6, (index) {
                                  int buttonIndex = index + 1;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedButton = buttonIndex;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        buttonIndex.toString(),
                                        style: GoogleFonts.josefinSans(
                                          color: const Color(0xFF042D00),
                                          fontSize:
                                              _selectedButton == buttonIndex
                                                  ? screenHeight * 0.7 * 0.045
                                                  : screenHeight * 0.7 * 0.03,
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                    .expand((widget) => [
                                          widget,
                                          if (widget !=
                                              Text(
                                                  '6')) // Add separators between buttons
                                            Text(
                                              '|',
                                              style: GoogleFonts.josefinSans(
                                                color: Color(0xFF042D00),
                                                fontSize:
                                                    screenHeight * 0.7 * 0.025,
                                              ),
                                            ),
                                        ])
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.7 * 0.03,
                            ),
                            Text(
                              'Type of Medication : ',
                              style: GoogleFonts.josefinSans(
                                  fontSize: screenHeight * 0.7 * 0.03,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF042D00),
                                  height: screenHeight * 0.001),
                            ),
                            SizedBox(
                              height: screenHeight * 0.7 * 0.03,
                            ),
                            // Image Selection
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex = 0;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/tablet.png',
                                    height: _selectedImageIndex == 0
                                        ? screenHeight * 0.7 * 0.13
                                        : screenHeight * 0.7 * 0.1,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.8 * 0.08,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex = 1;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/syrup.png',
                                    height: _selectedImageIndex == 1
                                        ? screenHeight * 0.7 * 0.13
                                        : screenHeight * 0.7 * 0.1,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: TextButton(
                    onPressed: () {
                      // Handle the "Done" button press
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Done',
                      style: GoogleFonts.josefinSans(
                        color: Color(0xFF053901),
                        fontSize: screenHeight * 0.7 * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.7 * 0.8,
                //right: screenWidth * 0.8 ,
                left: screenWidth * 0.8 * 0.7,
                child: Image.asset(
                  'assets/images/ipo_calender_left.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.07,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
