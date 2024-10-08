import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_landing_page/models/medicine_models.dart';

class ReminderContainerWidgets extends StatelessWidget {
  const ReminderContainerWidgets(
      {super.key,
      required this.medicineName,
      required this.numberOfTimes,
      required this.diagnosis,
      required this.medType});

  final int numberOfTimes;
  final String diagnosis;
  final MedicineType medType;
  final String medicineName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        height: screenHeight * 0.16,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: medType == MedicineType.tablet
              ? Color(0xFFBFD6AA)
              : Color(0xFFE2B9A6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.15 * 0.3,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: medType == MedicineType.tablet
                    ? Color(0xFF1E8E15)
                    : Color(0xFFCA7155),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      medicineName,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFFFFE8CD),
                        fontSize: screenHeight * 0.028,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // this is not working
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 6),
                      alignment: Alignment.center,
                      child: Image.asset(
                        medType == MedicineType.tablet
                            ? 'assets/images/tablet.png'
                            : 'assets/images/red_syrup.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'No. of Times: ',
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF054400)
                                      : Color(0xFFAA4A2B),
                                  fontSize: screenHeight * 0.16 * 0.13,
                                ),
                              ),
                              Text(
                                '$numberOfTimes times a day',
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF41733D)
                                      : Color(0xFFCA7155),
                                  fontSize: screenHeight * 0.16 * 0.12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Diagnosis: ',
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF054400)
                                      : Color(0xFFAA4A2B),
                                  fontSize: screenHeight * 0.16 * 0.13,
                                ),
                              ),
                              Text(
                                diagnosis,
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF41733D)
                                      : Color(0xFFCA7155),
                                  fontSize: screenHeight * 0.16 * 0.12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Time of Intake: ',
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF054400)
                                      : Color(0xFFAA4A2B),
                                  fontSize: screenHeight * 0.16 * 0.13,
                                ),
                              ),
                              Text(
                                ' ', // Placeholder for time of intake
                                style: GoogleFonts.josefinSans(
                                  color: medType == MedicineType.tablet
                                      ? Color(0xFF41733D)
                                      : Color(0xFFCA7155),
                                  fontSize: screenHeight * 0.16 * 0.12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
