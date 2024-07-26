import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:new_landing_page/models/medicine_models.dart';
import 'package:new_landing_page/pages/remider_page/wigets/reminder_container_widgets.dart';
import 'package:new_landing_page/repository/medicine_repository.dart';

class RemiderPageScreen extends StatefulWidget {
  static const String routeName = 'reminder-page';
  const RemiderPageScreen({super.key});

  @override
  State<RemiderPageScreen> createState() => _RemiderPageScreenState();
}

class _RemiderPageScreenState extends State<RemiderPageScreen> {
  late MedicineRepository _medicineRepository;
  List<MedicineModel> _medicinesForToday = [];

  @override
  void initState() {
    super.initState();
    _medicineRepository = MedicineRepository();
    _loadMedicinesForToday();
  }

  void _loadMedicinesForToday() async {
    try {
      List<MedicineModel> medicines =
          await _medicineRepository.getMedicinesForToday();
      print('Medicines for today: ${medicines.length}');
      if (medicines.isEmpty) {
        print('No medicines found for today');
      }
      setState(() {
        _medicinesForToday = medicines;
      });
    } catch (e) {
      print('Error loading medicines: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CD),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.3,
            right: screenWidth * 0.83,
            child: Image.asset(
              'assets/images/reminder_leaf2.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.4,
            ),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: screenWidth * 0.5,
            child: Image.asset(
              'assets/images/reminder_leaf3.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.4,
            ),
          ),
          Positioned(
            top: screenHeight * 0.02,
            right: screenWidth * 0.53,
            child: Image.asset(
              'assets/images/reminder_leaf1.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Center(
                child: Image.asset(
                  'assets/images/Reminders.png',
                  width: screenWidth * 0.6,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Text(
                'Take a pill, Stay chill',
                style: GoogleFonts.josefinSans(
                    color: const Color(0xFF053901),
                    fontSize: screenHeight * 0.031),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              // ListView.builder to display the medicines
              Expanded(
                child: ListView.builder(
                  itemCount: _medicinesForToday.length,
                  itemBuilder: (context, index) {
                    final medicine = _medicinesForToday[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ReminderContainerWidgets(
                          medicineName: medicine.medicineName,
                          numberOfTimes: medicine.numberOfTimesInDay,
                          Diagnosis: medicine.diagnosis,
                          medType: medicine.medicineType),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.04,
            child: Image.asset(
              'assets/images/reminder_left.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.07,
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.04,
            child: Image.asset(
              'assets/images/reminder_right.png',
              fit: BoxFit.cover,
              height: screenHeight * 0.07,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Color(0xFF92B78F), // Change to desired color
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   shape: CircleBorder(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
