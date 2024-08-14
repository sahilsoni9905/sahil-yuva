import 'package:flutter/material.dart';
import 'package:new_landing_page/pages/home_page/home_page_screen.dart';
import 'package:new_landing_page/pages/journal_page/journal_page_screen.dart';
import 'package:new_landing_page/pages/medical_records_page/medical_record_landing_page.dart';
import 'package:new_landing_page/pages/medical_records_page/medical_records_page_screen.dart';
import 'package:new_landing_page/pages/profile_page/profile_page_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  static const String routeName = 'bottom-bar';
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  bool _isBottomBarVisible = true;
  bool _isShowingLandingPage = false;

  List<Widget> pages = [
    const HomePageScreen(),
    const ProfilePageScreen(),
    const JournalPageScreen(),
    const MedicalRecordsPageScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkBottomBarVisibility();
  }

  void _checkBottomBarVisibility() {
    if (myCurrentIndex == 3 && !_isShowingLandingPage) {
      setState(() {
        _isBottomBarVisible = false;
        _isShowingLandingPage = true;
        pages[3] = const MedicalRecordLandingPage();
      });
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          pages[3] = const MedicalRecordsPageScreen();
          _isBottomBarVisible = true;
        });
      });
    } else {
      setState(() {
        _isBottomBarVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _isBottomBarVisible
          ? SafeArea(
              child: Container(
                height: screenHeight * 0.083,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06,
                    bottom: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xFFD7E5CA),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: const Color.fromARGB(255, 5, 59, 10),
                    // unselectedItemColor: Colors.black,
                    currentIndex: myCurrentIndex,
                    showSelectedLabels: false,

                    showUnselectedLabels: false,
                    onTap: (index) {
                      setState(() {
                        myCurrentIndex = index;
                        _checkBottomBarVisibility();
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: _buildIconWithLabel(
                          index: 0,
                          label: "Home",
                          iconPath: 'assets/images/home_icon.png',
                          screenHeight: screenHeight,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: _buildIconWithLabel(
                          index: 1,
                          label: "Profile",
                          iconPath: 'assets/images/profile_icon.png',
                          screenHeight: screenHeight,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: _buildIconWithLabel(
                          index: 2,
                          label: "Journal",
                          iconPath: 'assets/images/journal_icon.png',
                          screenHeight: screenHeight,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: _buildIconWithLabel(
                          index: 3,
                          label: "Records",
                          iconPath: 'assets/images/medical_record_icon.png',
                          screenHeight: screenHeight,
                        ),
                        label: "",
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: pages[myCurrentIndex],
    );
  }

  Widget _buildIconWithLabel({
    required int index,
    required String label,
    required String iconPath,
    required double screenHeight,
  }) {
    bool isSelected = myCurrentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      padding:
          EdgeInsets.symmetric(horizontal: isSelected ? 2 : 0, vertical: 4),
      child: Container(
        //    color: isSelected ? Colors.black : null, // i want it take all the he
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: screenHeight * 0.03,
              color: isSelected ? const Color.fromARGB(255, 5, 59, 10) : null,
            ),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 5, 59, 10),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
