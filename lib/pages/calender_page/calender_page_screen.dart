import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:new_landing_page/models/medicine_models.dart';
import 'package:new_landing_page/pages/calender_page/widgets/medicin_add_widget.dart';
import 'package:new_landing_page/repository/medicine_repository.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderPageScreen extends StatefulWidget {
  static const String routeName = 'Calender-page';
  const CalenderPageScreen({super.key});

  @override
  State<CalenderPageScreen> createState() => _CalenderPageScreenState();
}

class _CalenderPageScreenState extends State<CalenderPageScreen> {
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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM').format(now);
    String dayOfWeek = DateFormat('EEEE').format(now).substring(0, 3);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CD),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/Calender.png',
                    width: screenWidth * 0.55,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: DateTime.now(),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.josefinSans(
                          fontSize: screenHeight * 0.02,
                          color: const Color(0xFF053901)),
                      weekendTextStyle: GoogleFonts.josefinSans(
                        fontSize: screenHeight * 0.02,
                        color: const Color(0xFF053901),
                      ),
                      todayDecoration: const BoxDecoration(
                        color: Color(0xFF054400),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) =>
                          DateFormat.MMMM(locale).format(date),
                      titleTextStyle: GoogleFonts.josefinSans(
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.josefinSans(
                        color: const Color(0xFF053901),
                        fontSize: screenHeight * 0.018,
                      ),
                      weekendStyle: GoogleFonts.josefinSans(
                        color: const Color(0xFF053901),
                        fontSize: screenHeight * 0.017,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        return Container();
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.12,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCAD6C0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Today, $formattedDate, $dayOfWeek',
                        style: GoogleFonts.josefinSans(
                          color: const Color(0xFF053901),
                          fontSize: screenHeight * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Medications for the Day',
                        style: GoogleFonts.josefinSans(
                          color: const Color(0xFF053901),
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddMedicineDialog();
                                },
                              );
                            },
                            child: Container(
                              width: screenWidth * 0.13,
                              height: screenWidth * 0.13,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF92B78F),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: screenWidth * 0.09,
                              ),
                            ),
                          ),
                          ..._medicinesForToday.map((medicine) {
                            return Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: screenWidth * 0.4,
                                height: screenHeight * 0.24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: 2,
                                    color: medicine.medicineType ==
                                            MedicineType.tablet
                                        ? Color(0xFF1E8E15)
                                        : Color(0xFFA25035),
                                  ),
                                  color: medicine.medicineType ==
                                          MedicineType.tablet
                                      ? Color(0xFFBFD6AA)
                                      : Color(0xFFE2B9A6),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          medicine.medicineName,
                                          style: GoogleFonts.josefinSans(
                                              color: medicine.medicineType ==
                                                      MedicineType.tablet
                                                  ? Color(0xFF053901)
                                                  : Color(0xFFA25035),
                                              fontSize:
                                                  screenHeight * 0.24 * 0.15,
                                              fontWeight: FontWeight.w600,
                                              height: 0.5),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          '${medicine.numberOfTimesInDay} times a day',
                                          style: GoogleFonts.josefinSans(
                                              color: medicine.medicineType ==
                                                      MedicineType.tablet
                                                  ? Color(0xFF053901)
                                                  : Color(0xFFA25035),
                                              fontSize:
                                                  screenHeight * 0.24 * 0.09,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    medicine.medicineType == MedicineType.tablet
                                        ? Image.asset(
                                            'assets/images/tablet.png',
                                            height: screenHeight * 0.24 * 0.55,
                                          )
                                        : Image.asset(
                                            'assets/images/red_syrup.png',
                                            height: screenHeight * 0.24 * 0.55,
                                          )
                                  ],
                                ));
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenHeight * 0.042,
              right: screenWidth * 0.75,
              child: Image.asset(
                'assets/images/ipo_calender_left.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.07,
              ),
            ),
            Positioned(
              top: screenHeight * 0.042,
              left: screenWidth * 0.75,
              child: Image.asset(
                'assets/images/ipo_calender_right.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
